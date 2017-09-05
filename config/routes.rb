Rails.application.routes.draw do

  get 'settings' => "settings#index"

  resources :brands, only: [:index, :new, :create, :destroy]

  resources :employees, only: [:index, :new, :create, :destroy]

  resources :sales, only: [:new, :create]

  resources :inventories, only: [:index, :new, :create]

  get "inventories/search" => "inventories#search"

  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
