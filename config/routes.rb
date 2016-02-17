Rails.application.routes.draw do
  root to: 'home#index'
  resources :trips
  namespace :basic_example do
    resources :trips
    resources :trips_no_decanter
  end
  namespace :nested_example do
    resources :trips
    resources :trips_no_decanter
  end
  namespace :no_strong_params_example do
    resources :trips
  end
end
