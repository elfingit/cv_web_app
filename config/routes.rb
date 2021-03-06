Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get 'page/:id', to: 'pages#show', as: 'show_page'
  post 'message', to: 'message#create'
  get 'portfolio', to: 'portfolio#index', as: 'portfolio_index'

end
