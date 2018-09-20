Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root    'static_pages#home'
  get     '/help',      to: 'static_pages#help'
  get     '/about',     to: 'static_pages#about'
  get     '/contact',   to: 'static_pages#contact'
  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  get     '/words',     to: 'words#index'



  resources :categories, only:[:index]
  resources :users
  resources :dashboard, only:[:index]
  resources :lessons do
    resources :lesson_words
  end
  namespace :admin do
    resources :categories do
      resources :words do
      end
    end
  end

  resources :relationships
  resources :users do
    member do
     get :following, :followers
    end
  end
end
