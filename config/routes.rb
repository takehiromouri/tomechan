Rails.application.routes.draw do
  # devise_for :users
  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'static_pages/home', as: 'home'
  get 'presignup', to: 'static_pages#presignup', as: 'presignup'
  # get 'dashboard/index', as: 'dashboard'

end
