require 'mechanize'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def login_airbnb
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @agent.follow_meta_refresh = true

    page = @agent.get('https://www.airbnb.jp/')
    page = @agent.page.link_with(:href => '/login').click
    form = page.forms[1]
    form.action = "/authenticate"
    form.email = airbnb_email
    form.password = airbnb_password
    page = form.submit

  end

  def messages
    page = @agent.get('https://www.airbnb.jp/inbox')
    return page.search("ul#threads")
  end

  def reservations
    page = @agent.get('https://www.airbnb.jp/my_reservations')
    return page.search("tr")
    # details = reservations.at('td:contains("月")').text.strip
    # -> "2016年04月16日 - 2016年07月10日\n    \n    UENO ASAKUSA modern stylish house\n    \n        3 Chome-1-14 Higashinippori\n        \n        Arakawa-ku, Tōkyō-to 116-0014"
    # date => details.at('td:contains("月")').text.strip.split("\n")[0]
    # name => r.at('td:contains("月")').text.strip.split("\n")[2]
    # address 1 => r.at('td:contains("月")').text.strip.split("\n")[4]
    # address 2 => r.at('td:contains("月")').text.strip.split("\n")[6]
  end
end
