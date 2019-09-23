Rails.application.routes.draw do

  root "statics#show", page: "index"

  devise_for :user
  resources :users, only: [:show, :edit, :update]

  resources :charges

  resources :articles, only: [:index, :show] do
    resources :sub_articles, only: [:index, :show] do 
      resources :comments, except: [ :show]
    end
    resources :comments, except: [ :show]
  end

  resources :tutorials, only: [:index, :show] do
    resources :comments, except: [ :show]
  end

  resources :events, only: [:index, :show] do
    resources :comments, except: [ :show]
  end

  resources :blog_articles, only: [:index, :show] do
    resources :comments, except: [ :show]
  end

  namespace :admin do
    resources :articles
    resources :comments
    resources :events
    resources :sub_articles
    resources :tutotials
    resources :users
    resources :blog_articles
    resources :statics, only: [:index]
  end

  get ':page', to: 'statics#show', as: :static
end
