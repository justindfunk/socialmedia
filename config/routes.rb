Rails.application.routes.draw do
  resources :profiles
  resources :hooks, only: [] do
    resources :articles, only: [ :create ]
  end

  resources :groups, only: [ :index ]
  resources :interests, only: [ :create ]

  resources :tags, only: [ :index, :show ]
  resources :articles, only: [ :show, :create ]
  resources :hyperlinks, only: [] do
    collection do
      get 'scrape'
    end
  end

  get 'home/index'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
