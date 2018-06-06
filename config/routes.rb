Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "bars#index"
  # Routes for the Drink_order resource:
  # CREATE
  get "/drink_orders/new", :controller => "drink_orders", :action => "new"
  post "/create_drink_order", :controller => "drink_orders", :action => "create"

  # READ
  get "/drink_orders", :controller => "drink_orders", :action => "index"
  get "/drink_orders/:id", :controller => "drink_orders", :action => "show"

  # UPDATE
  get "/drink_orders/:id/edit", :controller => "drink_orders", :action => "edit"
  post "/update_drink_order/:id", :controller => "drink_orders", :action => "update"

  # DELETE
  get "/delete_drink_order/:id", :controller => "drink_orders", :action => "destroy"
  #------------------------------

  # Routes for the Food_order resource:
  # CREATE
  get "/food_orders/new", :controller => "food_orders", :action => "new"
  post "/create_food_order", :controller => "food_orders", :action => "create"

  # READ
  get "/food_orders", :controller => "food_orders", :action => "index"
  get "/food_orders/:id", :controller => "food_orders", :action => "show"

  # UPDATE
  get "/food_orders/:id/edit", :controller => "food_orders", :action => "edit"
  post "/update_food_order/:id", :controller => "food_orders", :action => "update"

  # DELETE
  get "/delete_food_order/:id", :controller => "food_orders", :action => "destroy"
  #------------------------------

  # Routes for the Drink resource:
  # CREATE
  get "/drinks/new", :controller => "drinks", :action => "new"
  post "/create_drink", :controller => "drinks", :action => "create"

  # READ
  get "/drinks", :controller => "drinks", :action => "index"
  get "/drinks/:id", :controller => "drinks", :action => "show"

  # UPDATE
  get "/drinks/:id/edit", :controller => "drinks", :action => "edit"
  post "/update_drink/:id", :controller => "drinks", :action => "update"

  # DELETE
  get "/delete_drink/:id", :controller => "drinks", :action => "destroy"
  #------------------------------

  # Routes for the Food_item resource:
  # CREATE
  get "/food_items/new", :controller => "food_items", :action => "new"
  post "/create_food_item", :controller => "food_items", :action => "create"

  # READ
  get "/food_items", :controller => "food_items", :action => "index"
  get "/food_items/:id", :controller => "food_items", :action => "show"

  # UPDATE
  get "/food_items/:id/edit", :controller => "food_items", :action => "edit"
  post "/update_food_item/:id", :controller => "food_items", :action => "update"

  # DELETE
  get "/delete_food_item/:id", :controller => "food_items", :action => "destroy"
  #------------------------------

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
