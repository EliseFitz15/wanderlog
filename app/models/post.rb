class Post < ActiveRecord::Base
  belongs_to :trip

  validates :trip, presence: true
  validates :headline, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 925 }
end
