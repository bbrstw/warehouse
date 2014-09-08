class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => :registrations }
  constraints(SubdomainPresent) do
    root 'static_pages#index', as: :subdomain_root
    devise_for :users, :controllers => { :invitations => 'invitations' }
    #devise_for :users
    resources :users, only: :index
    resources :whouses do
      resources :products do
      end
    end
    resources :suppliers
    resources :categories
    
  end
  
  constraints(SubdomainBlank) do
    root 'static_pages#index'
    resources :accounts, only: [:new, :create]
  end
  #match '' => 'users#home', via: :all, constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }

  #resources :users, :only => [:index, :show]
  #resources :accounts 
  #resources :users do
  #  get 'home', :on => :member
  #  resources :whouses do 
  #    resources :products
  #  end
  #end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
