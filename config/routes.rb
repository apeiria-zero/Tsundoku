Rails.application.routes.draw do
  controller :records do
  get 'records/index', to:"records#index"
  get "records/:id/show", to:"records#show"
  get "records/new", to:"records#new"
  post "records/create", to:"records#create"
  get "records/:id/edit", to:"records#edit"
  post "records/:id/update", to:"records#update"
  post "records/:id/destroy", to:"records#destroy"
  end

  controller :users do
    get "users/:id", to:"users#show"
    get "signup", to:"users#new"
    get "login", to:"users#login_form"
    post "login", to:"users#login"
    post "logout", to:"users#logout"
    post "users/create", to:"users#create"
    get "users/:id/edit", to:"users#edit"
    post "users/:id/update", to:"users#update"
  end

  controller :home do
  get "/", to:"home#top"
  get "/about", to:"home#about"
  end
end
