Rails.application.routes.draw do
  resources :posts

  root 'posts#home'


  get "/home", to: "posts#home", as: "home"
  get "new" => 'posts#new'
  get "contact_us" => 'pages#contact_us'
  get "/jackie", to: "posts#index", as: "jackie"

  

end