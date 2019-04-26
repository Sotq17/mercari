Rails.application.routes.draw do
  devise_for :users, skip: :all,  :controllers => {
    :registrations => 'users/registrations'
  }
  #  devise_scope :user do
  #   get "sign_up", :to => "users/registrations#information"
  # end
    devise_scope :user do
  get 'signup' => 'users/registrations#new'
  get 'registrations' => 'users/registrations#input_info'
  post 'create' => 'users/registrations#create'
  delete 'logout' => 'users/sessions#destroy'
end
  namespace :api do
    resources :genres, only: [:index,:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'items#index'
  resources :items, except: [:index] do
    collection do
      get 'search'
      get ':id/buy', to: 'items#buy',  as: :buy
    end
  end
  #  devise_scope :user do
  #   get 'users/thanks' => 'users/registrations#thanks'
  # end

  resources :categories, only: [:index,:show]
end
