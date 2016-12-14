Rails.application.routes.draw do
  
  resources :courses
  devise_for :admins, controllers: {:registrations => 'registrations'}

  get '/admins' => "dashboard#index", as: :user_root
  
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end

  get '/alumni', to: 'main#alumni'
  get '/about', to: 'main#about'
  root 'main#home'
  resources :subscribers, except: [:show]
  resources :interesteds, except: [:show]
  resources :newsletters, except: [:edit, :update]
  
  post "/interesteds/create", as: :create_email_student
  post "/subscribers/create", as: :create_email
  

  scope '(:locale)', locale: /en|es|br/ do
    get '/', to: 'main#home'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
