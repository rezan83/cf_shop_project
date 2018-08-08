require 'rails_helper'

describe UsersController, type: :controller do
    
    describe 'GET #show' do
    before(:all) do
        @user = FactoryBot.create(:user)
        @id = @user.id
        @user2 = FactoryBot.create(:user)
        @id2 = @user2.id
        @user3 = FactoryBot.create(:user)
        @id3 = @user3.id
        end
        
    context "user is loged in" do
        before do
            sign_in @user
        end
        it " user see his details" do
            get :show, params: {id: @id}
            expect(response).to be_ok
            expect(assigns(:user)).to eq @user
        end
        
        it "redirect if trying see another user" do
            get :show, params: {id: @id2}
            expect(response).to redirect_to (root_path)
        end
        
    end
    context "user is not loged in" do
        it "redirect to login" do
            get :show, params: {id: @id3}
            expect(response).to redirect_to (new_user_session_path)
        end
        
    end
  end
    
end