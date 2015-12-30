Rails.application.routes.draw do
  namespace :api do
    scope :beacons do
      get ':uuid' => 'beacons#show'
      get ':uuid/events/:kind' => 'events#show', as: :beacon_event
    end
  end
  resources :beacons
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
