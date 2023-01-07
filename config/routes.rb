Rails.application.routes.draw do
  # routes pour les listes
  # routes pour les signets
  resources :lists, only: %i[index show create new] do
    resources :bookmarks, only: %i[new create]
  end
  get 'bookmarks/:id', to: 'bookmarks#show', as: 'bookmark'
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
