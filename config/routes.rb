Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/merchants/:merchant_id/items',  to: 'items#index'
  get '/items',                         to: 'items#index'
  get '/items/:id',                     to: 'items#show', as: 'item'

  get '/merchants',           to: 'merchants#index'
  post '/merchants',          to: 'merchants#create'
  get '/merchants/new',       to: 'merchants#new'
  get '/merchants/:id/edit',  to: 'merchants#edit'
  get '/merchants/:id',       to: 'merchants#show', as: 'merchant'
  patch '/merchants/:id',     to: 'merchants#update'
  put '/merchants/:id',       to: 'merchants#update'
  delete '/merchants/:id',    to: 'merchants#destroy'

  post '/items/:item_id/reviews',     to: 'reviews#create', as: 'item_reviews'
  get '/items/:item_id/reviews/new',  to: 'reviews#new',    as: 'new_item_review'
  get '/reviews/:id/edit',            to: 'reviews#edit',   as: 'edit_review'
  patch '/reviews/:id',               to: 'reviews#update', as: 'review'
  put '/reviews/:id',                 to: 'reviews#update'
  delete '/reviews/:id',              to: 'reviews#destroy'

  get '/cart',                    to: 'cart#show'
  post '/cart/:item_id',          to: 'cart#add_item'
  delete '/cart',                 to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id',        to: 'cart#remove_item'

  get '/registration',  to: 'users#new',    as: :registration
  post '/users',        to: 'users#create'
  patch '/users/:id',   to: 'users#update', as: 'user'
  put '/users/:id',     to: 'users#udpate'
  patch '/user/:id',    to: 'users#update'
  get '/profile',       to: 'users#show'
  get '/profile/edit',  to: 'users#edit'

  get '/profile/edit_password', to: 'users#edit_password'

  post '/orders',               to: 'user/orders#create'
  get '/profile/orders',        to: 'user/orders#index'
  get '/profile/orders/:id',    to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#login'
  get '/logout',  to: 'sessions#logout'

  namespace :merchant do
    root 'dashboard#index', as: :dashboard

    get '/orders/:id',      to: 'orders#show'

    get '/items',           to: 'items#index'
    post '/items',          to: 'items#create'
    get '/items/new',       to: 'items#new'
    get '/items/:id/edit',  to: 'items#edit'
    patch '/items/:id',     to: 'items#update'
    put '/items/:id',       to: 'items#update'
    delete '/items/:id',    to: 'items#destroy'

    put '/items/:id/change_status', to: 'items#change_status'

    get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  end

  namespace :admin do
    root 'dashboard#index', as: :dashboard

    get '/merchants/:id',   to: 'merchants#show'
    patch '/merchants/:id', to: 'merchants#update'

    get '/users',     to: 'users#index'
    get '/users/:id', to: 'users#show'

    patch '/orders/:id/ship', to: 'orders#ship'
  end
end
