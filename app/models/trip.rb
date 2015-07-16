class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :albums

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :startdate, presence: true
end
