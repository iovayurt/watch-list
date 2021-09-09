Rails.application.routes.draw do
  get 'bookmarks/home'
  get 'lists/home'
  get 'movies/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
end
