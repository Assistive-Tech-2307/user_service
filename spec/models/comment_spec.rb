require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :link }
    it { should validate_presence_of :description }
    it { should validate_presence_of :user_comment }
    it { should validate_presence_of :rating }
  end

  describe "relationships" do
    it { should belong_to :category }
    it { should belong_to :user }
  end
end