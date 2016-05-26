require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #home" do
    context "when user is not logged in" do
      it "should return 200 OK" do
        get :home
        expect(response.status).to be(200)
      end
    end

    context "when user is logged in" do
      it "should redirect to dashboard" do
        sign_in FactoryGirl.create(:user)
        get :home
        expect(response).to redirect_to dashboard_path
      end
    end
  end
end
