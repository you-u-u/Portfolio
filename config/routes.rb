Rails.application.routes.draw do
  root 'staticpages#top'
  get 'privacy_policy', to: 'staticpages#privacy_policy'
  get 'term', to: 'staticpages#term'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    delete 'logout', to: 'users/sessions#destroy'
  end

  get 'users/auth/line', to: redirect('/users/auth/line')

  patch 'users/set_line_notification', to: 'users#set_line_notification'
      
  resources :poses, only: [:show] do
    collection do
      get 'bookmarks'
    end
  endc
  get 'pose/random', to: 'poses#random', as: 'random_pose'

  resources :diaries, only: %i[new create index show edit update]

  resources :bookmarks, only: %i[create destroy]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  match '*path', to: 'application#routing_error', via: :all
end
