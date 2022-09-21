module Mutations
  class CreatePost < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    type Types::PostType

    # TODO: define arguments
    argument :post_input, Types::Input::PostInputType, required: true
    # type Types::Input::PostInputType


    def resolve(result)
      p result[:post_input]
      post = Post.new(**post_input)
      post.save!
      post
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
