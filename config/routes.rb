IntegracaoIME::Application.routes.draw do

  root :to => "welcome#index"

  get "resumes" => "company#resumes", :as => :resumes
  get "resume/:id" => "company#resume", :as => :user_resume
  get "calendars" => "company#calendars", :as => :calendars
  get "how_to" => "company#how_to", :as => :how_to
  get "sponsor" => "company#sponsor", :as => :sponsor
  get "highlight" => "company#highlight", :as => :highlight
  post "highlight" => "company#create_highlight", :as => :create_highlight
  put "highlight" => "company#update_highlight", :as => :update_highlight

  get "resume" => "students#resume", :as => :resume
  get "resume/new" => "students#new_resume", :as => :new_resume
  post "resume/new" => "students#create_resume", :as => :create_resume
  get "resume/edit" => "students#edit_resume", :as => :edit_resume
  put "resume/edit" => "students#update_resume", :as => :update_resume
  get "hints" => "students#hints", :as => :hints

  get "feedback" => "users#feedback", :as => :feedback
  post "feedback" => "users#send_feedback", :as => :send_feedback

  devise_for :users,
             :skip => [:sessions, :registrations],
             :controllers => {:registrations => "registrations"}

  devise_scope :user do
    #get "login" => "devise/sessions#new", :as => :new_user_session
    post "login" => "devise/sessions#create", :as => :user_session
    delete "logout" => "devise/sessions#destroy", :as => :destroy_user_session

    get "register" => "registrations#new", :as => :new_user_registration
    post "register" => "registrations#create", :as => :user_registration
  end

  get "terms" => "welcome#terms", :as => :terms

  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
