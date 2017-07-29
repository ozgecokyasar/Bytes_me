Rails.application.routes.draw do
  get('/', { to: 'welcome#about' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drills do
    member do
      get :delete
    end
  end

end
