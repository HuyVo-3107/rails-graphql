module Queries
  class FetchComments < BaseQuery
    type [Types::CommentType], null: false

    def resolve
      Comment.all.order(created_at: :desc)
    end
  end
end
