Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :persons, only: [:show]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
    collection do
      match 'search' => 'books#search', via: [:get, :post]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/top'
  get 'home/top'
  get 'home/about'
  root 'home#top'
  post '/users/:id/update' => 'users#update'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'tags/:tag', to: 'books#index', as: :tag
  post   '/favorites/:book_id' => 'favorites#create',   as: 'favorite'
  delete '/favorites/:book_id' => 'favorites#destroy', as: 'destroy'
end

