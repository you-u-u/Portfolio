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
  # LINEログイン
  get 'users/auth/line', to: redirect('/users/auth/line')
  # LINE通知設定
  patch 'users/set_line_notification', to: 'users#set_line_notification'
      
  resources :poses, only: [:show]
  get 'pose/random', to: 'poses#random', as: 'random_pose'

  resources :diaries, only: %i[new create index show edit update]

  # Sidekiq job 管理画面
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # エラー画面カスタマイズ
  match '*path', to: 'application#routing_error', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
