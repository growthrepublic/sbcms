Rails.application.routes.draw do
  namespace :api do
    scope :beacons do
      get ':uuid' => 'beacons#show'
    end
  end
  resources :beacons
  root to: 'dashboard#index'
end
