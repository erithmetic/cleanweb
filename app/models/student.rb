class Student < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

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
    }
end
