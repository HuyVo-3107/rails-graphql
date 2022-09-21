class Post < ApplicationRecord
  enum status: {active: 1, cancel: 0}

  validates_presence_of :title

  has_many :comments, dependent: :destroy
  belongs_to :user
end
