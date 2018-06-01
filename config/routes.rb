Rails.application.routes.draw do
  # Routes for the Bar resource:
  # CREATE
  get "/bars/new", :controller => "bars", :action => "new"
  post "/create_bar", :controller => "bars", :action => "create"

  # READ
  get "/bars", :controller => "bars", :action => "index"
  get "/bars/:id", :controller => "bars", :action => "show"

  # UPDATE
  get "/bars/:id/edit", :controller => "bars", :action => "edit"
  post "/update_bar/:id", :controller => "bars", :action => "update"

  # DELETE
  get "/delete_bar/:id", :controller => "bars", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
