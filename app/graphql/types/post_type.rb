# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: true
    field :status ,Types::Enums::PostStatusType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, [CommentType], null: true do
      argument :cursor, Integer, required: false
    end
    field :custom_field, String

    def custom_field
      "Field custom"
    end
    def comments( cursor: nil)
      scope = dataloader.with(Sources::ActiveRecordCollection, ::Comment, key: :post_id).load(object.id)

      scope = scope.where("id < cursor", cursor) if cursor
      scope
    end

  end
end
