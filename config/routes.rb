Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :sectors
  resources :institutions do
    scope module: :institutions do
      resources :pending_documents, only: [:index]
    end
  end
  resources :document_types
  resources :state_transition_documents
  resources :document_records
  resource :deliver_document, only: [:create]
  resources :institution_searchs, only: :index

  root 'pages#index'
  get 'pages/index'
end