module Mutations
  class CommentDelete < BaseMutation
    argument :id, Integer, required: true

    type Types::CommentType

    def resolve(id:)
      begin
        Comment.destroy(id)
      rescue ActiveRecord::RecordNotFound => exception
        raise GraphQL::ExecutionError.new("Comment not deleted.")
      end
    end
  end
end