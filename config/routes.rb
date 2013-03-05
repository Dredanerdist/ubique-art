UbiqueArt::Application.routes.draw do
  resources :painting_at_spots


  resources :spots


  resources :tag_categories


  resources :tags


  resources :artist_profiles


  resources :paintings


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end