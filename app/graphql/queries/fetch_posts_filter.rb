require 'search_object'
require 'search_object/plugin/graphql'

module Queries
  class FetchPostsFilter < Queries::BaseQuery
    include SearchObject.module(:graphql)

    type [Types::PostType], null: false
    # extras [:lookahead]

    scope { ::Post.all }

    option(:title, type: String) { |scope, value| scope.where("title like '%#{value}%'") }
    option(:first, type: Integer) { |scope, value| scope.limit(value) }
  end
end
