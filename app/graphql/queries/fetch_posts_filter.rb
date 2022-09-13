module Queries
  class FetchPostsFilter < Queries::BaseQuery
    include SearchObject.module(:graphql)
    description 'Lists all posts'

    scope { Post.all }

    option(:title, type: String) { |scope, value| scope.where title: value }
  end
end
