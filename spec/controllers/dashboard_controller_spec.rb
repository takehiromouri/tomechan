require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      it "should return 200" do
        sign_in FactoryGirl.create(:user)
        get :index
        expect(response.status).to be(200)
      end
    end

    context "when user is not logged in" do
      it "should redirect user" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
