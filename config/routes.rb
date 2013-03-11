UbiqueArt::Application.routes.draw do
  resources :painting_at_spots


  resources :spots


  resources :tag_categories


  resources :tags


  resources :artist_profiles


  resources :paintings


  authenticated :user do
    root :to => 'spots#index'
  end
  root :to => "home#index" # landing page
  devise_for :users
  resources :users 
  
  match '/users/:id/like/:painting_id' => 'users#like'
  match '/users/:id/unlike/:painting_id' => 'users#unlike'
  
end