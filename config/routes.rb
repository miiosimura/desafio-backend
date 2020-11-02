Rails.application.routes.draw do
  devise_for :admins
  root to: 'congressmen#index'

  resources :congressmen, only: [:index, :show]

  get 'dataset', to: 'datasets#show_import'
  post 'dataset_import', to: 'datasets#import'
end
