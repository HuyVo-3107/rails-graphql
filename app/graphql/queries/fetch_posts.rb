module Queries
  class FetchPosts < Queries::BaseQuery
    description "Fetch list posts"

    type [Types::PostType], null: false
    extras [:lookahead]

    def resolve(lookahead:)
      puts lookahead.arguments
      posts = Post.order(created_at: :desc)

      return posts unless lookahead.selects?(:comments)

      posts.includes(:comments)
      #
      # ::Post.all

    end
  end
end
