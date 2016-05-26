require 'mechanize'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def login_airbnb
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.follow_meta_refresh = true

    page = agent.get('https://www.airbnb.jp/')
    page = agent.page.link_with(:href => '/login').click
    form = page.forms[1]
    form.action = "/authenticate"
    form.email = airbnb_email
    form.password = airbnb_password
    page = form.submit

    @agent = agent
  end

  def messages
    page = @agent.get('https://www.airbnb.jp/inbox')
    return page.search("ul#threads")
  end
end
