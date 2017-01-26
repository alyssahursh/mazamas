Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'pages#index'

  get 'pages/index'
  get 'pages/test', as: 'test'

  post 'payments/stripe', to: 'payments#stripe'
  get 'payments/stripe', to: 'payments#stripe', as: 'payments'


  resources :climb_classes,
            :climb_schedules,
            :climb_tags,
            :climbs,
            :climber_educations,
            :climber_experiences,
            :climb_leader_profiles,
            :educations,
            :general_dates,
            :routes,
            :specific_dates,
            :user_roles


post 'users/start_subscription', to: 'users#start_subscription', as: 'subscribe'
post 'users/end_autorenew', to: 'users#end_autorenew', as: 'end_autorenew'
post 'users/restart_autorenew', to: 'users#restart_autorenew', as: 'restart_autorenew'

resources :users do
  resources :climbs do
    resources :climb_apps
  end
end

resources :mountains do
  resources :climbs
end

resources :users do
  resources :climb_apps
  resources :climber_profiles
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
