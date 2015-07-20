class Highlight < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user

  validates :location_name, presence: true, length: { maximum: 40 }
  validates :memory, length: { maximum: 350 }
  validates :latitude, presence: true
  validates :longitude, presence: true

  mount_uploader :highlight_photo, CoverPhotoUploader
end
