class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.page(params[:page]).per(10)

    render("food_items/index.html.erb")
  end

  def show
    @food_order = FoodOrder.new
    @food_item = FoodItem.find(params[:id])

    render("food_items/show.html.erb")
  end

  def new
    @food_item = FoodItem.new

    render("food_items/new.html.erb")
  end

  def create
    @food_item = FoodItem.new

    @food_item.name = params[:name]
    @food_item.image = params[:image]
    @food_item.price = params[:price]

    save_status = @food_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_items/new", "/create_food_item"
        redirect_to("/food_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Food item created successfully.")
      end
    else
      render("food_items/new.html.erb")
    end
  end

  def edit
    @food_item = FoodItem.find(params[:id])

    render("food_items/edit.html.erb")
  end

  def update
    @food_item = FoodItem.find(params[:id])

    @food_item.name = params[:name]
    @food_item.image = params[:image]
    @food_item.price = params[:price]

    save_status = @food_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_items/#{@food_item.id}/edit", "/update_food_item"
        redirect_to("/food_items/#{@food_item.id}", :notice => "Food item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food item updated successfully.")
      end
    else
      render("food_items/edit.html.erb")
    end
  end

  def destroy
    @food_item = FoodItem.find(params[:id])

    @food_item.destroy

    if URI(request.referer).path == "/food_items/#{@food_item.id}"
      redirect_to("/", :notice => "Food item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food item deleted.")
    end
  end
end
