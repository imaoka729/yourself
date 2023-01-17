Rails.application.routes.draw do

  post 'users_search', to: 'users#search'
  #post '/', to: 'users#search'

  resources :savings
  resources :foods
  get 'foods/:id/syouhi' => 'foods#syouhi', as: 'syouhi_food'
  post 'foods_search', to: 'foods#search'
  resources :categories
  get 'menu/top'
  get 'menu/index'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  post '/savings_search',to:'savings#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
