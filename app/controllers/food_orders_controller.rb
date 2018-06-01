class FoodOrdersController < ApplicationController
  def index
    @q = FoodOrder.ransack(params[:q])
    @food_orders = @q.result(:distinct => true).includes(:bar, :food).page(params[:page]).per(10)

    render("food_orders/index.html.erb")
  end

  def show
    @food_order = FoodOrder.find(params[:id])

    render("food_orders/show.html.erb")
  end

  def new
    @food_order = FoodOrder.new

    render("food_orders/new.html.erb")
  end

  def create
    @food_order = FoodOrder.new

    @food_order.food_id = params[:food_id]
    @food_order.bar_id = params[:bar_id]

    save_status = @food_order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_orders/new", "/create_food_order"
        redirect_to("/food_orders")
      else
        redirect_back(:fallback_location => "/", :notice => "Food order created successfully.")
      end
    else
      render("food_orders/new.html.erb")
    end
  end

  def edit
    @food_order = FoodOrder.find(params[:id])

    render("food_orders/edit.html.erb")
  end

  def update
    @food_order = FoodOrder.find(params[:id])

    @food_order.food_id = params[:food_id]
    @food_order.bar_id = params[:bar_id]

    save_status = @food_order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_orders/#{@food_order.id}/edit", "/update_food_order"
        redirect_to("/food_orders/#{@food_order.id}", :notice => "Food order updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food order updated successfully.")
      end
    else
      render("food_orders/edit.html.erb")
    end
  end

  def destroy
    @food_order = FoodOrder.find(params[:id])

    @food_order.destroy

    if URI(request.referer).path == "/food_orders/#{@food_order.id}"
      redirect_to("/", :notice => "Food order deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food order deleted.")
    end
  end
end
