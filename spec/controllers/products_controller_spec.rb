require 'rails_helper'

describe ProductsController, type: :controller do
    before(:all) do
        @product1 = FactoryBot.create(:product)
        @id = @product1.id
        @user1 = FactoryBot.create(:user)
        @admin = FactoryBot.create(:admin)
    end
    
    describe 'GET #show' do
        context "product exists" do
            it "render show page" do
                get :show, params: {id: @id}
                expect(response).to be_ok
                expect(response).to render_template("show")
            end
        end
    end
    
    describe 'GET #edit' do
        context "guest try edit product" do
            it "redirect to login page" do
                get :edit, params: {id: @id}
               expect(response).to redirect_to (new_user_session_path)
            end
        end
        context "user try edit product" do
            before do
                sign_in @user1
            end
            it "redirect to main page" do
                get :edit, params: {id: @id}
                expect(response).to redirect_to (root_path)
            end
        end
        context "admin try edit product" do
            before do
                sign_in @admin
            end
            it "get edit page" do
                get :edit, params: {id: @id}
               expect(response).to be_ok
               expect(response).to render_template("edit")
            end
        end
    end
    
    
    
    
end