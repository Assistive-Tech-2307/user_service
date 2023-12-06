require "rails_helper"

module Types
  RSpec.describe QueryType, type: :request do
    describe "#all_category_comments" do
      it "returns all categories based off a specific category id" do
        @user_1 = User.create(name: "bob", email: "bob@gmail.com", password: "1234")

        @category_1  = Category.create(title: "Blindness")
        @category_2 = Category.create(title: "Low Vision")

        @comment_1 = Comment.create(title: "this is my title", 
        link: "link.com",
        description: "this is my description",
        user_comment: "this is my comment",
        rating: true,
        category_id: @category_1.id,
        user_id: @user_1.id)

        @comment_2 = Comment.create(title: "another title", 
        link: "anotherlink.com", 
        description: "this is another description", 
        user_comment: "this is my comment", 
        rating: true,
        category_id: @category_1.id,
        user_id: @user_1.id)

        @comment_3 = Comment.create(title: "low vision title",
        link: "lowvision.com",
        description: "this is a low vision description",
        user_comment: "this is a low vision comment",
        rating: false,
        category_id: @category_2.id,
        user_id: @user_1.id)

        gql_query = <<~GQL
                      {
                        allCategoryComments(
                            categoryId: #{@category_1.id}
                        ) {
                            id
                            title
                            link
                            description
                            userComment
                            rating
                            categoryId
                            userId
                          }
                        }
                      GQL

        post "/graphql", params: { query: gql_query }

        expect(response).to be_successful

        comments = JSON.parse(response.body, symbolize_names: true)

        expect(comments).to have_key(:data)
        expect(comments[:data]).to be_a(Hash)

        expect(comments[:data]).to have_key(:allCategoryComments)
        expect(comments[:data][:allCategoryComments]).to be_an(Array)
        expect(comments[:data][:allCategoryComments].count).to eq(2)

        comment_data = comments[:data][:allCategoryComments].first

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
        
        expect(comment_data).to have_key(:categoryId)
        expect(comment_data[:categoryId]).to be_an(Integer)

        expect(comment_data).to have_key(:userId)
        expect(comment_data[:userId]).to be_an(Integer)
      end
    end
  end
end