class DrinkOrdersController < ApplicationController
  def index
    @drink_orders = DrinkOrder.page(params[:page]).per(10)

    render("drink_orders/index.html.erb")
  end

  def show
    @drink_order = DrinkOrder.find(params[:id])

    render("drink_orders/show.html.erb")
  end

  def new
    @drink_order = DrinkOrder.new

    render("drink_orders/new.html.erb")
  end

  def create
    @drink_order = DrinkOrder.new

    @drink_order.drink_id = params[:drink_id]
    @drink_order.bar_id = params[:bar_id]

    save_status = @drink_order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drink_orders/new", "/create_drink_order"
        redirect_to("/drink_orders")
      else
        redirect_back(:fallback_location => "/", :notice => "Drink order created successfully.")
      end
    else
      render("drink_orders/new.html.erb")
    end
  end

  def edit
    @drink_order = DrinkOrder.find(params[:id])

    render("drink_orders/edit.html.erb")
  end

  def update
    @drink_order = DrinkOrder.find(params[:id])

    @drink_order.drink_id = params[:drink_id]
    @drink_order.bar_id = params[:bar_id]

    save_status = @drink_order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drink_orders/#{@drink_order.id}/edit", "/update_drink_order"
        redirect_to("/drink_orders/#{@drink_order.id}", :notice => "Drink order updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Drink order updated successfully.")
      end
    else
      render("drink_orders/edit.html.erb")
    end
  end

  def destroy
    @drink_order = DrinkOrder.find(params[:id])

    @drink_order.destroy

    if URI(request.referer).path == "/drink_orders/#{@drink_order.id}"
      redirect_to("/", :notice => "Drink order deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Drink order deleted.")
    end
  end
end
