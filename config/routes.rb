Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'items#index'
  resources :items, except: [:index] do
    collection do
      get 'search'
      get ':id/buy' => 'items#buy'
    end
  end
end
