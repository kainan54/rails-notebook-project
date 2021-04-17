Rails.application.routes.draw do

  resources :sections, except: [ :index ]
  
  resources :note_books, except: [ :index ]
  get 'note_books/browse/:page', to: 'note_books#index', as: 'note_books_browse'

  get 'search', to: 'search#search_users_and_note_books', as: 'default_search'

  post 'like_note_book', to: 'saved_note_books#toggle_likes', as: 'toggle_note_book_likes'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'profile/:id', to: 'user_profiles#profile', as: 'user_profile'

  root 'home#index'

end
