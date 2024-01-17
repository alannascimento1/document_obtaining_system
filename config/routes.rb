Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :sectors
  resources :institutions
  resources :document_types
  resources :state_transition_documents

  root 'pages#index'
  get 'pages/index'
end