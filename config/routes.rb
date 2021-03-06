Rails.application.routes.draw do

  devise_for :users
  resources :users do
    member do
      get :confirm_email
    end
  end
	resources :keys, only: [:new, :create, :destroy, :show]
	resources :storages, only: [:new, :edit, :update, :create]
	resources :retrievals, only: [:new, :edit, :update, :create]
	resources :comments, only: [:new, :create, :delete, :show]
	resources :admin, only: [:index]

		namespace :admin do
			resources :users, only: [:index, :edit, :update, :destroy, :delete]
			resources :keys, only: [:index, :edit, :update]
			resources :locations, only: [:show, :new, :create, :index, :destroy, :update, :edit]
			resources :storages, only: [:new, :edit, :update, :create]
      
    		namespace :locations do
    			resources :authorise, only: [:show, :new]
				  post "authorise/:id" => "authorise#authorise"
			  end
        namespace :locations do
          resources :retrieval_authorise, only: [:show, :new]
          post "retrieval_authorise/:id" => "retrieval_authorise#retrieval_authorise"
        end
  	end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
	root 'static_pages#home'

	get "contact" => "static_pages#contact"
	get "account" => "users#account"
  get "payment" => "payments#new"

  get "account/change/email" => "users#change_email"
  post "account/change/email" => "users#change_email_do"

  get "account/change/mobile" => "users#change_mobile"
  post "account/change/mobile" => "users#change_mobile_do"

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
