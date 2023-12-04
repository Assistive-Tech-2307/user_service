# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :comment_create, mutation: Mutations::CommentCreate
    field :comment_delete, mutation: Mutations::CommentDelete
    field :sessionCreate, Types::UserType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def sessionCreate(email:, password:)
      user = User.find_by(email: email)
      if user&.authenticate(password)
        user
      else
        raise GraphQL::ExecutionError.new("Invalid email or password")
      end
    end
  end
end
