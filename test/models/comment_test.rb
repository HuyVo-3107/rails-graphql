# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
