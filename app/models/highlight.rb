class Highlight < ActiveRecord::Base
  belongs_to :trip

  validates :trip, presence: true
  validates :location_name, presence: true, length: { maximum: 40 }
  validates :memory, length: { maximum: 350 }
  validates :latitude, presence: true
  validates :longitude, presence: true

  mount_uploader :highlight_photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode,  if: :address_changed?
end
