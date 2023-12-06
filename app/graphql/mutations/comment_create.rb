module Mutations
  class CommentCreate < BaseMutation
    argument :title, String, required: true
    argument :link, String, required: true
    argument :description, String, required: true
    argument :user_comment, String, required: true
    argument :rating, Boolean, required: true
    argument :category, String, required: true
    argument :user_id, Integer, required: true

    type Types::CommentType

    def resolve(title:, link:, description:, user_comment:, rating:, category:, user_id:)
      Comment.create!(
        title: title,
        link: link,
        description: description,
        user_comment: user_comment,
        rating: rating,
        category_id: Category.find_by(title: category).id,
        user_id: user_id
      )
    end
  end
end