class Album < ActiveRecord::Base
  belongs_to :trip

  validates :trip, presence: true
  validates :photos, presence: true

  mount_uploaders :photos, AlbumUploader
end
