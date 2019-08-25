Rails.application.routes.draw do
  devise_for :users, path: 'cashcash-keepers', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users do
    resources :categories, except: :show
  end
  resources :accounts do
    resources :reconciliations, only: [:index, :new, :create]
  end  
  root to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
