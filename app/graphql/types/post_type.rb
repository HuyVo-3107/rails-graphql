# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: false
    field :status ,Types::Enums::PostStatusType, null: true
    field :comments, [Types::CommentType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
