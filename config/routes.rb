Rails.application.routes.draw do
    devise_for :users
    resources :users, only: [:show, :edit] do
      collection do
        get 'signout',  to: 'users#signout'
        get 'exhibit',  to: 'users#exhibit', as: :exhibit
        get 'sold'   ,  to: 'users#sold', as: :sold
        get 'purchase', to: 'users#purchase', as: :purchase
      end
    end

   # , skip: :all,  :controllers => {
#     :registrations => 'users/registrations',
#     :sessions => 'users/sessions'
#   }
#   #  devise_scope :user do
#   #   get "sign_up", :to => "users/registrations#information"
#   # end
#     devise_scope :user do
#   get 'signup' => 'users/registrations#new'
#   get 'registrations' => 'users/registrations#input_info'
#   post 'create' => 'users/registrations#create'
#   get 'signin' => 'users/sessions#index'
#   delete 'logout' => 'users/sessions#destroy'
# end
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
    resources :purchases, only: [:index, :create]
  end
  #  devise_scope :user do
  #   get 'users/thanks' => 'users/registrations#thanks'
  # end

  resources :categories, only: [:index,:show] do
  	collection do
      get 'category_search', to: 'categories#category_search'
      get 'grandchild_search', to: 'categories#grandchild_search'
    end
  end

  resources :cards, only: [:new, :destroy, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      get  'card', to: 'cards#card'
    end
  end


end
