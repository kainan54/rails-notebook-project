Rails.application.routes.draw do

  resources :sections
  resources :note_books
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root 'home#index'

end
