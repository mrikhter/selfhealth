Selfhealth::Application.routes.draw do
  resources :test_types

  root :to => "pages#home"

  
  # get "login" => "sessions#new", :as => "login"
  # get "logout" => "sessions#destroy", :as => "logout"
  
  controller :sessions do
    get "login" => :new, :as => "login"
    post "login" => :create
    # delete "logout" => :destroy, :as => "logout"
    get "logout" => :destroy, :as => "logout"
  end
  
  resources :users, :except => [:edit]
  get "signup" => "users#new", :as => "signup"
  get "profile" => "users#edit", :as => "edit_profile"
  
  resources :user_tests do
    resources :results do 
      collection do
        get 'edit_multiple'
        put 'update_multiple'
      end
    end
  end

  controller :pages do
    get "home" => :home, :as => "home"
    get "welcome" => :welcome, :as => "welcome"
    get "about" => :about, :as => "about"
    get "contact" => :contact, :as => "contact"
  end
  resources :test_types
  
  resources :tests do
    resources :items do
      collection do
        post 'edit_multiple'
        put 'update_multiple'
      end
      resources :normal_ranges
    end
  end


  resources :laboratories 

  match "compare" => "compare#compare", via: [:get, :post]
  


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
