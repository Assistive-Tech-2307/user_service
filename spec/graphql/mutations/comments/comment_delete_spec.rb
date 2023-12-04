require "rails_helper"

module Mutations
  module Comments
    RSpec.describe CommentDelete, type: :request do
      it "deletes a comment" do
        @category_1  = Category.create(title: "Blindness")
        @comment_1 = Comment.create(title: "this is my title", link: "link.com",
        description: "this is my description",
        user_comment: "this is my comment",
        rating: true,
        user_recommended: true,
        category_id: @category_1.id)

        gql_query = <<~GQL
                      mutation {
                        commentDelete(
                            input: {
                                id: #{@comment_1.id}
                            }
                        ) {
                            id
                            title
                            link
                            description
                            userComment
                            rating
                            userRecommended
                            categoryId
                        }
                    }
                GQL

        post "/graphql", params: { query: gql_query } 

        expect(response).to be_successful
        expect(Comment.count).to eq(0)

        comment = JSON.parse(response.body, symbolize_names: true)

        expect(comment).to have_key(:data)
        expect(comment[:data]).to be_a(Hash)

        expect(comment[:data]).to have_key(:commentDelete)
        expect(comment[:data][:commentDelete]).to be_a(Hash)

        comment_data = comment[:data][:commentDelete]

        expect(comment_data).to have_key(:id)
        expect(comment_data[:id]).to be_a(String)
        
        expect(comment_data).to have_key(:title)
        expect(comment_data[:title]).to be_a(String)
        
        expect(comment_data).to have_key(:link)
        expect(comment_data[:link]).to be_a(String)
        
        expect(comment_data).to have_key(:description)
        expect(comment_data[:description]).to be_a(String)
        
        expect(comment_data).to have_key(:userComment)
        expect(comment_data[:userComment]).to be_a(String)
        
        expect(comment_data).to have_key(:rating)
        expect(comment_data[:rating]).to be_in([true, false])
        
        expect(comment_data).to have_key(:userRecommended)
        expect(comment_data[:userRecommended]).to be_in([true, false])
        
        expect(comment_data).to have_key(:categoryId)
        expect(comment_data[:categoryId]).to be_an(Integer)        
      end

      it "returns error key if not deleted" do
        gql_query = <<~GQL
                      mutation {
                        commentDelete(
                            input: {
                                id: 1
                            }
                        ) {
                            id
                            title
                            link
                            description
                            userComment
                            rating
                            userRecommended
                            categoryId
                        }
                    }
                GQL

        post "/graphql", params: { query: gql_query } 

        message = JSON.parse(response.body, symbolize_names: true)

        expect(message[:data]).to have_key(:commentDelete)
        expect(message[:data][:commentDelete]).to eq(nil)

        expect(message).to have_key(:errors)
        expect(message[:errors]).to be_an(Array)

        expect(message[:errors].first).to have_key(:message)
        expect(message[:errors].first[:message]).to eq("Comment not deleted.")
      end
    end
  end
end