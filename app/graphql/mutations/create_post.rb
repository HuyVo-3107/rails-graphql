module Mutations
  class CreatePost < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :title, String, required: true
    # type Types::Input::PostInputType
    type Types::PostType

    def resolve(title: nil)
      Post.create!(title: title)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
