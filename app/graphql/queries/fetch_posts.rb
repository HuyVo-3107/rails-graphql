module Queries
  class FetchPosts < Queries::BaseQuery
    type [Types::PostType], null: false
    extras [:lookahead]

    def resolve
      Post.all.order(created_at: :desc)
    end

    private

    def relation_with_includes(lookahead)
      return Post.all unless lookahead.selects?(:comments)

      Post.includes(:comments)
    end
  end
end
