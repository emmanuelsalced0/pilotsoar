Rails.application.routes.draw do
  resources :posts

  root 'posts#home'


  get "/home", to: "posts#home", as: "home"
  get "new" => 'posts#new'
  get "pricing" => 'pages#pricing'
  get "contact_us" => 'pages#contact_us'

  match 'jackie', to: 'posts#index', via: :all

end