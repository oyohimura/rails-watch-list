Rails.application.routes.draw do
  # routes pour les listes
  # routes pour les signets
  resources :lists, only: %i[index show create new] do
    resources :bookmarks, only: %i[new]
  end
  get 'bookmarks/:id', to: 'bookmarks#show', as: 'bookmark'
  post 'lists/:list_id/bookmarks', to: 'bookmarks#create', as: 'list_bookmarks'
  post 'lists/:list_id/bookmarks', to: 'bookmarks#create', as: 'bookmarks'
  delete 'bookmarks/:id', to: 'bookmarks#destroy'

  root to: 'lists#index'
end
