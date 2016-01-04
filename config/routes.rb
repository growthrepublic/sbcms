Rails.application.routes.draw do
  namespace :api do
    scope :beacons do
      get ':uuid'               => 'beacons#show'
      get ':uuid/events'        => 'events#index'
      get ':uuid/events/:kind'  => 'events#show',   as: :beacon_event
    end
    get 'beacons' => 'beacons#index'
  end
  resources :beacons do
    collection do
      post 'fetch' => 'beacons#fetch'
    end
  end
  resources :events,    only: :update
  resources :settings,  only: [:new, :create] do
    collection do
      get   'edit' => 'settings#edit'
      post  'edit' => 'settings#update'
    end
  end
  resources :sessions,  only: [:new, :create]
  root to: 'dashboard#index'
end
