require 'search_object'
require 'search_object/plugin/graphql'

module Queries
  class FetchPostsFilter < Queries::BaseQuery
    include SearchObject.module(:graphql)

    type [Types::PostType], null: false

    scope { Post.all }

    option(:title, type: String) { |scope, value| scope.where title: value }
  end
end
