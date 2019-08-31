Rails.application.routes.draw do
  resources :money_transactions, except: :show
  resources :categories, except: :show
  resources :accounts, except: :show
  resources :attachments, only: :destroy

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    authenticated :user do
      root to: 'static_pages#dashboard'
    end 
    unauthenticated :user do
      root to: 'users/sessions#new'
    end
  end

  patch 'accounts/:id/unarchive', to: 'accounts#unarchive', as: :unarchive_account
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
