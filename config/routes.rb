Rails.application.routes.draw do
  # devise_for :users
  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'static_pages/home', as: 'home'
  get 'presignup', to: 'static_pages#presignup', as: 'presignup'
  get 'privacy_policy', to: 'static_pages#privacy_policy', as: 'privacy_policy'
  get 'terms_and_conditions', to: 'static_pages#terms_and_conditions', as: 'terms_and_conditions'
  # get 'dashboard/index', as: 'dashboard'

end
