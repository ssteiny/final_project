class BarsController < ApplicationController
  def index
    @bars = Bar.all
    @location_hash = Gmaps4rails.build_markers(@bars.where.not(:address_latitude => nil)) do |bar, marker|
      marker.lat bar.address_latitude
      marker.lng bar.address_longitude
      marker.infowindow "<h5><a href='/bars/#{bar.id}'>#{bar.name}</a></h5><small>#{bar.address_formatted_address}</small>"
    end

    render("bars/index.html.erb")
  end

  def show
    @drink_order = DrinkOrder.new
    @food_order = FoodOrder.new
    @bar = Bar.find(params[:id])

    render("bars/show.html.erb")
  end

  def new
    @bar = Bar.new

    render("bars/new.html.erb")
  end

  def create
    @bar = Bar.new

    @bar.name = params[:name]
    @bar.address = params[:address]
    @bar.style = params[:style]
    @bar.cuisine = params[:cuisine]
    @bar.happy_hour_start_time = params[:happy_hour_start_time]
    @bar.happy_hour_end_time = params[:happy_hour_end_time]
    @bar.latitude = params[:latitude]
    @bar.longitude = params[:longitude]

    save_status = @bar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bars/new", "/create_bar"
        redirect_to("/bars")
      else
        redirect_back(:fallback_location => "/", :notice => "Bar created successfully.")
      end
    else
      render("bars/new.html.erb")
    end
  end

  def edit
    @bar = Bar.find(params[:id])

    render("bars/edit.html.erb")
  end

  def update
    @bar = Bar.find(params[:id])

    @bar.name = params[:name]
    @bar.address = params[:address]
    @bar.style = params[:style]
    @bar.cuisine = params[:cuisine]
    @bar.happy_hour_start_time = params[:happy_hour_start_time]
    @bar.happy_hour_end_time = params[:happy_hour_end_time]
    @bar.latitude = params[:latitude]
    @bar.longitude = params[:longitude]

    save_status = @bar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bars/#{@bar.id}/edit", "/update_bar"
        redirect_to("/bars/#{@bar.id}", :notice => "Bar updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bar updated successfully.")
      end
    else
      render("bars/edit.html.erb")
    end
  end

  def destroy
    @bar = Bar.find(params[:id])

    @bar.destroy

    if URI(request.referer).path == "/bars/#{@bar.id}"
      redirect_to("/", :notice => "Bar deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bar deleted.")
    end
  end
end
