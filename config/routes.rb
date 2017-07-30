Rails.application.routes.draw do
  get('/', { to: 'welcome#about', as: 'home' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create] do
    member do
      get :confirm_email
    end
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :drills do
     member do
       get :delete
     end
   end

   resources :drill_groups do
     member do
       get :delete
     end
   end

end
