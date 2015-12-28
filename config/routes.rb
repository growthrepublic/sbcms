Rails.application.routes.draw do
  namespace :api do
    scope :beacons do
      get ':uuid' => 'beacons#show'
      get ':uuid/events/:kind' => 'events#show'
    end
  end
  resources :beacons
  resources :events, only: :update
  root to: 'dashboard#index'
end
