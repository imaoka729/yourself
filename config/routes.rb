Rails.application.routes.draw do
  resources :savings
  resources :foods
  get 'foods/:id/syouhi' => 'foods#syouhi', as: 'syouhi_food'
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
