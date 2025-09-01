Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "welcome#index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/articles" => "articles#index"
  get "/articles/new" => "articles#new", as: "new_article"
  post "/articles" => "articles#create", as: "create_article"
  get "/articles/:id" => "articles#show", as: "article"
  get "/articles/:id/edit" => "articles#edit", as: "edit_article"
  patch "/articles/:id" => "articles#update", as: "patch_article"
  delete "/articles/:id" => "articles#delete", as: "delete_article"

  get "/users" => "users#index"
  get "/users/new" => "users#new", as: "sign_up"
  post "/users" => "users#create", as: "create_user"
  get "/users/:id" => "users#show", as: "user"
  get "/users/:id/edit" => "users#edit", as: "edit_information"
  patch "/users/:id" => "users#update", as: "update_information"
  delete "/users/:id" => "users#delete", as: "delete_account"

  post "/articles/:id" => "comments#create", as: "article_comments"
  get "/comment/:id/edit" => "comments#edit", as: "edit_comment"
  patch "/comment/:id" => "comments#update", as: "update_comment"
  delete "/comment/:id" => "comments#delete", as: "delete_comment"

  # get ""
  # get "/users" => "users#index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
