require "rails_helper"

module Mutations
  module Comments
    RSpec.describe CommentCreate, type: :request do
      it "creates a comment" do
        @user_1 = User.create(name: "bob", email: "bob@gmail.com", password: "1234")
        @category_1  = Category.create(title: "Blindness")

        gql_query = <<~GQL
                    mutation {
                      commentCreate(
                          input: {
                              title: "this is my title",
                              link: "link.com",
                              description: "this is my description",
                              userComment: "this is my comment",
                              rating: true,
                              userRecommended: true,
                              category: "Blindness"
                              userId: #{@user_1.id}
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
                          userId
                      }
                  }
                GQL

        post "/graphql", params: { query: gql_query } 

        expect(response).to be_successful
        expect(Comment.count).to eq(1)

        comment = JSON.parse(response.body, symbolize_names: true)

        expect(comment).to have_key(:data)
        expect(comment[:data]).to be_a(Hash)

        expect(comment[:data]).to have_key(:commentCreate)
        expect(comment[:data][:commentCreate]).to be_a(Hash)

        comment_data = comment[:data][:commentCreate]

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

        expect(comment_data).to have_key(:userId)
        expect(comment_data[:userId]).to be_an(Integer)
      end
    end
  end
end