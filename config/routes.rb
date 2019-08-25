Rails.application.routes.draw do
  resources :money_transactions, except: :show
  resources :categories, except: :show
  resources :accounts do
    resources :reconciliations, only: [:index, :new, :create]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
