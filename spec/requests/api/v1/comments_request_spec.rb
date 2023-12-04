require "rails_helper"

RSpec.describe "Comments Request" do
  before(:each) do
    @user = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    @category_1  = Category.create(title: "Blindness")
    @category_2  = Category.create(title: "Low Vision")
    @category_3  = Category.create(title: "Deaf/Hard of Hearing")
    @category_4  = Category.create(title: "Mobility Supports for Fine Motor Issues")
    @category_5 = Category.create(title: "Mobility Supports for Gross Motor Issues")
    @category_6 = Category.create(title: "Cognitive Supports for Reading and Writing")
    @category_7 = Category.create(title: "Cognitive Supports for Math")
    @category_8 = Category.create(title: "Cognitive Supports for Focus")
    @category_9 = Category.create(title: "Communication Supports")
  end
  it "creates a comment and returns comment information" do
    post "/api/v1/comments", params: {title: "title", link: "abc.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category: "Blindness"}

    expect(response).to be_successful

    comment = JSON.parse(response.body, symbolize_names: true)

    expect(comment).to have_key(:id)
    expect(comment[:id]).to be_an(Integer)
    
    expect(comment).to have_key(:title)
    expect(comment[:title]).to be_a(String)
    
    expect(comment).to have_key(:link)
    expect(comment[:link]).to be_a(String)
    
    expect(comment).to have_key(:description)
    expect(comment[:description]).to be_a(String)
    
    expect(comment).to have_key(:user_comment)
    expect(comment[:user_comment]).to be_a(String)
    
    expect(comment).to have_key(:title)
    expect(comment[:title]).to be_a(String)
    
    expect(comment).to have_key(:rating)
    expect(comment[:rating]).to eq(true)
    
    expect(comment).to have_key(:user_recommended)
    expect(comment[:user_recommended]).to eq(true)
    
    expect(comment).to have_key(:category_id)
    expect(comment[:category_id]).to be_a(Integer)
    
    expect(comment).to have_key(:created_at)
    expect(comment[:created_at]).to be_a(String)
    
    expect(comment).to have_key(:updated_at)
    expect(comment[:updated_at]).to be_a(String)
  end

  it "returns erorr when can't create comment" do
    post "/api/v1/comments", params: {link: "abc.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category: "Blindness", user_id: 1}

    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to eq({
      error: "Comment not created."
    })
  end

  it "deletes comment and returns success message" do
    comment = Comment.create(title: "title", link: "abc.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category_id: @category_1.id)

    delete "/api/v1/comments/#{comment.id}"

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to eq({
      success: "Comment has been deleted."
    })
  end

  it "returns error message if comment not deleted" do
    delete "/api/v1/comments/1"

    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to eq({
      error: "Comment has not been deleted."
    })
  end

  it "returns all comments" do
    comment_1 = Comment.create(title: "title", link: "abc.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category_id: @category_1.id)
    comment_2 = Comment.create(title: "another title", link: "abcdef.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category_id: @category_1.id)
    comment_3 = Comment.create(title: "yet another title", link: "abcdefg.com", description: "a description", user_comment: "this is my comment", rating: true, user_recommended: true, category_id: @category_1.id)

    get "/api/v1/comments"

    expect(response).to be_successful

    comments = JSON.parse(response.body, symbolize_names: true)

    expect(comments).to be_an(Array)
    expect(comments.count).to be(3)

    comments.each do |comment|
      expect(comment).to have_key(:id)
      expect(comment[:id]).to be_an(Integer)
      
      expect(comment).to have_key(:title)
      expect(comment[:title]).to be_a(String)
      
      expect(comment).to have_key(:link)
      expect(comment[:link]).to be_a(String)
      
      expect(comment).to have_key(:description)
      expect(comment[:description]).to be_a(String)
      
      expect(comment).to have_key(:user_comment)
      expect(comment[:user_comment]).to be_a(String)
      
      expect(comment).to have_key(:title)
      expect(comment[:title]).to be_a(String)
      
      expect(comment).to have_key(:rating)
      expect(comment[:rating]).to eq(true)
      
      expect(comment).to have_key(:user_recommended)
      expect(comment[:user_recommended]).to eq(true)
      
      expect(comment).to have_key(:category_id)
      expect(comment[:category_id]).to be_a(Integer)
      
      expect(comment).to have_key(:created_at)
      expect(comment[:created_at]).to be_a(String)
      
      expect(comment).to have_key(:updated_at)
      expect(comment[:updated_at]).to be_a(String)
    end
  end
end