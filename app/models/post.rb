class Post < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags

  validates :title, :content, presence: true
end
