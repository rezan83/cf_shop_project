require 'rails_helper'

describe Product do
    
    before(:all) do
            @product = FactoryBot.create(:product)
            @user = FactoryBot.create(:user)
            @product.comments.create!(rating: 3, user: @user, body: "Meeh!")
            @product.comments.create!(rating: 4, user: @user, body: "Ok bike!")
            @product.comments.create!(rating: 5, user: @user, body: "Great bike!")
    end
        
    context "product's comments and rating" do
        
        it "has 3 comments" do
          expect(@product.comments.count).to eq 3
        end
        it "avarage rating should be 4" do
          expect(@product.average_rating).to eq 4
        end
        
    end
    
    context "creating product" do
        it "named product with no description should be valid" do
          expect(Product.new(name: "good bike")).to be_valid
        end
        it "unnamed product should not be valid" do
          expect(Product.new(description: "not that bad")).not_to be_valid
        end
    end
    
end