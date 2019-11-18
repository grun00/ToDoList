Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :tasks, only: %i[index show new create update edit destroy] do
    get 'confirm_delete', on: :member
    get 'complete', on: :collection
    get 'incomplete', on: :collection
    post 'search', on: :collection
    post 'change_status', on: :member
    post 'change_privacy', on: :member
    post 'make_comment', on: :member
    delete 'delete_comment', on: :member 
  end

  resources :profiles, only: %i[show new create update edit] do
    get 'private_page', on: :member
    post 'change_privacy', on: :member
    resources :comments, only: %i[index]
  end

  post 'plus_comment',  to: "comments#plus_comment"

end
