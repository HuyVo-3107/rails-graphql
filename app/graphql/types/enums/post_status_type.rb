module Types
  module Enums
    class PostStatusType < Types::BaseEnum
      description "Post status enum"

      Post.statuses.each_key do |type|
        value type.upcase, value: type
      end
    end
  end
end