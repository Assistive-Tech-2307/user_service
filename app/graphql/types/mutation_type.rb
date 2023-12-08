# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :comment_create, mutation: Mutations::CommentCreate
    field :comment_delete, mutation: Mutations::CommentDelete
    field :sessionCreate, mutation: Mutations::SessionCreate
  end
end
