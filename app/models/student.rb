require 'cgi'

class Student < ActiveRecord::Base
  has_many :test_takers
  has_many :exams, :through => :test_takers
  has_many :addresses

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
end
