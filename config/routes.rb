Rails.application.routes.draw do

  get 'settings' => "settings#index"

  resources :brands, only: [:index, :new, :create, :destroy]

  resources :employees, only: [:index, :new, :create, :destroy]

  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
