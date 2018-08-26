Rails.application.routes.draw do
  devise_for :users

  root 'root#top'

  get '/home/about' => 'about#about'
  
  get '/users/sign_in' => 'devise/sessions#new'

  get '/users/sign_up' => 'devise/registrations#new'

  resources :books

  resources :users




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
