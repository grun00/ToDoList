Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :tasks, only: %i[index show new create update edit destroy] do
    get 'confirm_delete', on: :member
  end

end
