class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.login_airbnb
    @messages = current_user.messages
    @reservations = current_user.reservations
  end
end
