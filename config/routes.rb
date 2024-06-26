Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :sectors
  resources :institutions
  resources :document_types
  resources :state_transition_documents
  resources :document_records
  resources :institution_searchs, only: :index

  root 'pages#index'
  get 'pages/index'
end