Rails.application.routes.draw do

  # get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :articles do
    # //层级关系
    resources :comments
  end


  # resources :welcome
  get 'welcome' => 'welcome#index', :as => 'welcome' #还是这样直接写的好

  get "signup" => "users#signup", :as => "signup"
  resources :users, only: [:create] #这个是怎么个用法


  #issues
  # get 'issues/new' => "issues#new" # 主要这一行要写在 get '/issues/:id' 的上面
  # # get '/issues/:id' => "issues#show"
  # get 'issues/:id' => "issues#show", :as => "issue" #定义别名
  # delete 'issues/:id' => 'issues#destroy'
  # get 'issues' => 'issues#index', :as => 'issues'
  # post 'issues' => 'issues#create'
  # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
  # patch 'issues/:id' => 'issues#update'

  resources :issues



  # comments
  post '/issues/:issue_id/comments' => "icomments#create"


  # end
  #
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
