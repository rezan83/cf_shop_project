require 'rails_helper'

describe Comment do
    
    before(:all) do
        @product = FactoryBot.create(:product)
        @user = FactoryBot.create(:user)
    end
    
    context "Creating comments" do
        
        it "comment with body and rating is valid" do
            expect(Comment.new(user: @user, product: @product, rating: 3, body: "it ok")).to be_valid
        end
        
        it "comment with only body is not valid" do
            expect(Comment.new(user: @user, product: @product, body: "it ok")).not_to be_valid
        end
        
        it "comment with only rating is not valid" do
            expect(Comment.new(user: @user, product: @product, rating: 3)).not_to be_valid
        end
        
    end
    
    context "There is no user" do
        it "comment  is not valid" do
            expect(Comment.new(product: @product, rating: 3, body: "it ok")).not_to be_valid
        end
        
    end
    
    
    
end