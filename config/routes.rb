Rails.application.routes.draw do
  resources :blogs
  resources :profiles, except: [:show]
  get '/profile/:id', to: "profiles#show", as: 'profile_show'
  get 'pages/home'
  root "pages#home"
  get "about-me", to: 'pages#about'
  get "contact", to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
