Rails.application.routes.draw do
  resources :trips
  root to: 'trips#new'
end
