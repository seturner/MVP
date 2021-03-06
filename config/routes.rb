MVP::Application.routes.draw do

  get "follow/index"

  get "follow/new"

  


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "signups#new"


  match "home" => "signups#new"
  match "/meow" => "home#meow"
  get "/done" => "signups#done"
  get "/thanks" => "signups#thanks"
  #get "/wireframes" => redirect {"http://mainstproject.com/wireframes"}

  get "home/index"
  get "home/howitworks"
  get "home/teamandjobs"
  get "home/contactus"
  get "home/tos"
  get "home/teamandjobsREAL"
  #get "home/blog"

  resources :images
  resources :signups
  resources :guests
  resources :comments
  resources :locations

  namespace :api do
    resources :charges
    resources :campaigns
    resources :events
    resources :locations
    resources :profiles
  end

  resources :campaigns
  resources :profiles

  resources :events do
    resources :tickets do
      resources :guests
    end
    resources :images
    resources :follows
  end

  devise_for :users, controllers: {omniauth_callbacks: "authentications"} do
    resource :image
  end

  resources :user_answers
  resources :survey_questions
  
  resources :points
  
  get "survey" => "survey_questions#survey"
  #get "incomplete_survey" => "survey_questions#survey"
  
  # I have no idea what changed that caused me to have to add this line...????
  #devise_scope :user do 
  #  get '/users/sign_out' => 'devise/sessions#destroy' 
  #end

  match 'events/:id/feedback' => 'events#feedback'

  #resources :accreditations
  #resources :authentications #, :only => [:show]
  #resources :investments
  #resources :projects

  #resources :survey_answers

#########################################################################

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

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
