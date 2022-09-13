module Queries
  class FetchPosts < Queries::BaseQuery
    type [Types::PostType], null: false
    extras [:lookahead]

    def resolve(lookahead:)
      posts = Post.all.order(created_at: :desc)

      return posts unless lookahead.selects?(:comments)

      posts.includes(:comments)
    end
  end
end
