Rails.application.routes.draw do

  devise_for :views
  resources :albums
  resources :photos, :except => [:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
end
