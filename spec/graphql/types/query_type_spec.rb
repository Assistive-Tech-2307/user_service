require "rails_helper"

module Types
  RSpec.describe QueryType, type: :request do
    describe "#all_comments" do
      it "returns all comments" do
        @category_1  = Category.create(title: "Blindness")
        @comment_1 = Comment.create(title: "this is my title", 
        link: "link.com",
        description: "this is my description",
        user_comment: "this is my comment",
        rating: true,
        user_recommended: true,
        category_id: @category_1.id)
        @comment_2 = Comment.create(title: "another title", 
        link: "anotherlink.com", 
        description: "this is another description", 
        user_comment: "this is my comment", 
        rating: true,
        user_recommended: true,
        category_id: @category_1.id)

        gql_query = <<~GQL
                  {
                    allComments {
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
                  
        comments = JSON.parse(response.body, symbolize_names: true)

        expect(comments).to have_key(:data)
        expect(comments[:data]).to be_a(Hash)

        expect(comments[:data]).to have_key(:allComments)
        expect(comments[:data][:allComments]).to be_an(Array)
        expect(comments[:data][:allComments].count).to eq(2)

        comment_data = comments[:data][:allComments].first

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
    end
  end
end