Rails.application.routes.draw do


  resources :employees do
  	  resources :leaves
  	  devise_for :users
end
get :emp_leave_status, :controller=>:employees,:action => :emp_leave_status
get :apply_leave_action, :controller=>:leaves, :action => :apply_leave
get :apply_leave, :controller=>:leaves, :action => :apply_leave
post :apply_leave_action, :controller=>:leaves, :action => :apply_leave_action
get :leave_credit, :controller=>:leave_credit, :action => :leave_credit

get :leave_credit_create, :controller=>:leave_credit, :action => :leave_credit_create
post :destroy, :controller=>:leaves, :action=>:destroy

get :index ,:controller=>:home, :action=>:index
post :status_edit, :controller=>:leaves, :action=>:status_edit
post :update, :controller=>:leaves, :action=>:update

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get :users_sign_out, :controller => :users, :action => :users_sign_out
 devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end

 get 'users/password', to: redirect("/")

      root :to => "leaves#apply_leave"

end
