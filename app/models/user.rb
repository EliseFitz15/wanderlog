class User < ActiveRecord::Base
  has_many :trips
  has_many :posts, through: :trips
  has_many :albums, through: :trips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader
end
