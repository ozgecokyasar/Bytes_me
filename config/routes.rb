Rails.application.routes.draw do

  get 'leader_boards/index'

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

resources :drills do
  resources :answers
end

resources :attempted_drills


 resources :drill_groups do
   member do
     get :delete
   end
 end

 resources :leader_boards, only: :index
 resources :my_drills, only: [:index, :destroy] do
   member do
     get :delete
   end
 end

end
