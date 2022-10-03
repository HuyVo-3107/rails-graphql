# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  status     :integer          default("cancel"), not null
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  resourcify
  has_paper_trail
  enum status: {active: 1, cancel: 0}

  validates_presence_of :title

  has_many :comments, dependent: :destroy
  belongs_to :user
end
