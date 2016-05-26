class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.login_airbnb
    @messages = current_user.messages
    # require 'mechanize'
    # agent = Mechanize.new
    # agent.user_agent_alias = 'Mac Safari'
    # agent.follow_meta_refresh = true

    # page = agent.get('https://www.airbnb.jp/')
    # page = agent.page.link_with(:href => '/login').click
    # form = page.forms[1]
    # form.action = "/authenticate"
    # form.email = current_user.airbnb_email
    # form.password = current_user.airbnb_password
    # page = form.submit
    # page = agent.get('https://www.airbnb.jp/inbox')
    
    # @messages = page.search("ul#threads")
  end
end
