Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :tasks, only: %i[index show new create destroy update edit]

  post 'change_status', to: 'tasks#change_status'
end
