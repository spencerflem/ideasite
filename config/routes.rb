Rails.application.routes.draw do
  devise_for :users
  root to: 'comments#index'
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end
