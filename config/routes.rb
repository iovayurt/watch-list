Rails.application.routes.draw do
  get 'index' => "site#index"
  resources :lists, only: [ :index, :show, :new, :create ] do
    resources :bookmarks, only: [ :create, :new ]
  end

  resources :bookmarks, only: :destroy
end
