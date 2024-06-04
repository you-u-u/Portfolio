Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # sessions: 'users/sessions'ここLINEログイン
    #omniauth_callbacks: "omniauth_callbacks"
  }
  # 追加
  # get 'users/auth/line', to: redirect('/users/auth/line')ここLINEログイン
  
  root 'staticpages#top'
  resources :poses, only: [:show]

  get 'pose/randam', to: 'poses#random', as: 'random_pose'
  # get 'pose', to: 'poses/#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
