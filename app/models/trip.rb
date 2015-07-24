class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :highlights, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :startdate, presence: true

  mount_uploader :cover_photo, CoverPhotoUploader
end
