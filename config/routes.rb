Rails.application.routes.draw do
  namespace :api do
    resources :genres, only: [:index,:show]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'items#index'
  resources :items, except: [:index] do
    collection do
      get 'search'
      get ':id/buy', to: 'items#buy',  as: :buy
    end
  end

  resources :categories, only: [:index,:show]
end
