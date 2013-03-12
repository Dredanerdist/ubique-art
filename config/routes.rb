UbiqueArt::Application.routes.draw do
  match '/help', to: 'static_pages#help'
  match '/impressum', to: 'static_pages#impressum'
  match '/about', to: 'static_pages#index'
  
  resources :painting_at_spots


  resources :spots


  resources :tag_categories


  resources :tags


  resources :artist_profiles


  resources :paintings


  root :to => "static_pages#index" # landing page
  devise_for :users
  resources :users 
  
  match '/users/:id/like/:painting_id' => 'users#like'
  match '/users/:id/unlike/:painting_id' => 'users#unlike'
  match '/paintings/:id/qr_png' => 'paintings#qr_png'
  match '/paintings/:id/qr_download' => 'paintings#qr_download'
    
end