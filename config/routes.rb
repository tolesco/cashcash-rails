Rails.application.routes.draw do
  resources :money_transactions, except: :show
  resources :categories, except: :show
  resources :accounts, except: :show
  resources :attachments
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'static_pages#about'
  # delete 'attachments/:id', to: 'attachments#destroy', as: :attachment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
