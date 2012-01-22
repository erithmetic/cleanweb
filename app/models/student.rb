require 'cgi'

class Student < ActiveRecord::Base
  has_many :test_takers
  has_many :exams, :through => :test_takers
  has_many :addresses

  accepts_nested_attributes_for :addresses

  scope :celebrities, where(:celebrity => true)


  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  Paperclip.interpolates(:remote_avatar_url) do |attachment, style|
    size = nil
    size_data = attachment.styles[style]
    thumb_size = size_data.to_s.match(/\d+/).to_a.first
    attachment.instance.remote_avatar_url(thumb_size.to_i) if thumb_size
  end

  has_attached_file :avatar, :styles => {
      :large => '150x150>',
      :medium => '100x100>',
      :small => '75x75>'
    },
    :storage => :s3,
    :bucket => 'mybucket',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :default_url => ":remote_avatar_url",
    :default_style => :medium

  def remote_avatar_url(size = 100)
    facebook_avatar_url || gravatar_url(size) || default_avatar_url
  end

  def gravatar_url(size)
    if email.present?
      hash = Digest::MD5.hexdigest(email.downcase.strip)[0..31]
      "http://www.gravatar.com/avatar/#{hash}.jpg?size=#{size}"
    end
  end

  def default_avatar_url
    '/images/default_avatar.png'
  end

  def apply_omniauth(omniauth)
    case omniauth['provider']
    when 'facebook'
      self.apply_facebook(omniauth)
    end
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'],
                          :token => omniauth['credentials']['token'])
  end

  def apply_facebook(omniauth)
    if omniauth['extra'] && omniauth['extra']['user_hash']
      self.email = omniauth['extra']['user_hash']['email']
      self.email = omniauth['extra']['user_hash']['email']
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if student = Student.where(:email => data.email).first
      student
    else
      Student.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.find_for_tendril_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    puts data.inspect
    if student = Student.where(:email => data.email).first
      student.tendril_key = request.env['omniauth.auth']['client_id']
      student.tendril_secret = request.env['omniauth.auth']['client_secret']
      student
    else
      Student.create!(:email => data.email, :password => Devise.friendly_token[0,20],
        :tendril_key => data['client_id'],
        :tendril_secret => data['client_secret']
                     ) 
    end
  end

  def self.new_with_session(params, session)
    super.tap do |student|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        student.email = data["email"]
      elsif data = session["devise.tendril_data"] && session["devise.tendril_data"]["extra"]["raw_info"]
        student.email = data["email"]
      end
    end
  end

  def gas
    1022
  end

  def oil
    1013
  end

  def electricity
    addresses.map(&:readings).flatten.sum(&:amount).to_i
  end

  def square_footage
    addresses.sum(&:square_footage)
  end

  def total_energy
    gas + oil + (electricity * 3413)
  end

  GPAS = {
    (3.0..4.0) => (0..10_000),
    (2.0..2.9) => (10_000..14_999),
    (1.0..1.9) => (15_000..19_999),
    (0.6..0.9) => (20_000..24_999),
    (0.5..0.7) => (25_000..99_999)
  }

  def gpa
    if square_footage > 0
      btu_sqf = total_energy / square_footage

      score = GPAS.find do |score, amount|
        amount.include?(btu_sqf)
      end
      score ||= [(0.5..0.7), (250_000..999_999_999)]
      gpa_range = score.first
      score_range = score.last

      score_ratio = (btu_sqf - score_range.min) / (score_range.max - score_range.min)

      ((gpa_range.max - gpa_range.min) * score_ratio) + gpa_range.min
    end
  end
end
