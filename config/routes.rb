Rails.application.routes.draw do
  root 'items#index'

  post '/search', to: 'search#index', as: 'search'
  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace 'api' do
    namespace 'v1' do
      resources :items, only: [:index, :show, :destroy]
    end
  end
end
