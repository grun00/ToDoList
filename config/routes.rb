Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :tasks, only: %i[index show new create update edit destroy] do
    get 'confirm_delete', on: :member
    get 'complete', on: :collection
    get 'incomplete', on: :collection
  end

  resources :profiles

  post 'change_status', to: 'tasks#change_status'
  post 'change_privacy', to: 'tasks#change_privacy'
  post 'search', to: 'tasks#search'
end
