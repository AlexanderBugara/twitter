class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :content, length: { maximum: 140 }
end
