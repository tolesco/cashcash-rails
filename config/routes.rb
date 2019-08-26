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

  devise_scope :user do
    authenticated :user do
      root to: 'static_pages#dashboard'
    end 
    unauthenticated :user do
      root to: 'users/sessions#new'
    end
  end

  root to: 'static_pages#about'
  # delete 'attachments/:id', to: 'attachments#destroy', as: :attachment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
