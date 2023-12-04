class Api::V1::CommentsController < ApplicationController
  def index
    render json: Comment.all
  end
  def create
    comment = Comment.new(
      title: params[:title],
      link: params[:link],
      description: params[:description],
      user_comment: params[:user_comment],
      rating: params[:rating],
      user_recommended: params[:user_recommended],
      category_id: Category.find_by(title: params[:category]).id
    )

    if comment.save
      render json: comment
    else
      render json: {error: "Comment not created."}, status: 404
    end
  end

  def destroy
    begin
      Comment.destroy(params[:id])
      render json: {success: "Comment has been deleted."}
    rescue ActiveRecord::RecordNotFound => exception
      render json: {error: "Comment has not been deleted."}, status: 404
    end
  end
end