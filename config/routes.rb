Rails.application.routes.draw do
  root 'mint#index'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'
  get 'login', to: redirect('/users/sign_in')

  resources :account, only: [:index, :update]
  resources :projects, only: [:edit, :update]

  resources :smart_contracts, only: [:new, :show, :update, :create]
  get 'verifying', to: 'smart_contracts#verifying'
  patch 'verify', to: 'smart_contracts#verify'

  resources :mint, only: [:index]

  # static pages
  pages = %w(
    privacy terms
  )

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end
end
