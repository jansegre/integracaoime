IntegracaoIME::Application.routes.draw do

  root :to => "welcome#index"

  get "page/:slug" => "pages#show", :as => :page

  get "resume" => "students#resume", :as => :student_resume
  post "resume" => "students#create_resume", :as => :stdudent_create_resume
  put "resume" => "students#update_resume", :as => :student_update_resume
  get "hints" => "students#hints", :as => :student_hints

  get "resumes" => "company#resumes", :as => :company_resumes
  # the following route has to come after resume/new and resume/edit
  get "resume/:id" => "company#resume", :as => :company_user_resume
  get "calendars" => "company#calendars", :as => :company_calendars
  get "how_to" => "company#how_to", :as => :company_how_to
  get "sponsor" => "company#sponsor", :as => :company_sponsor
  get "highlight" => "company#highlight", :as => :company_highlight
  post "highlight" => "company#create_highlight", :as => :company_create_highlight
  put "highlight" => "company#update_highlight", :as => :company_update_highlight

  get "feedback" => "users#feedback", :as => :feedback
  post "feedback" => "users#send_feedback", :as => :send_feedback
  get "change_password" => "users#change_password", :as => :change_password
  put "change_password" => "users#update_password", :as => :update_password

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
