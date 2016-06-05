class StaticPagesController < ApplicationController

  def home
    # devise追加したらuncommentする
    # return redirect_to dashboard_path if user_signed_in? 
    render layout: 'layouts/landing_page'
  end

  def presignup
    # return redirect_to dashboard_path if user_signed_in?
    render layout: 'layouts/landing_page'
  end
end
