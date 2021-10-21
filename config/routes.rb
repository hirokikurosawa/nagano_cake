Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  passwords: 'customers/passwords',
  registrations: 'customers/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :admins do
    get '/admin', to: 'homes#top'
  end

  namespace :admins do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]

  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      get :check
      patch :destroy
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:index, :new, :create, :show]do
      collection do
        get :check
        get :thanks
      end
    end

  end

end
