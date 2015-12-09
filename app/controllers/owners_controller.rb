class OwnersController < ApplicationController
  def index
    @owner = Owner.all.sort_by{|onr| onr.first_name }
  end

  def show
    @owner = nil
    @owner = Owner.find(params[:id])
  
  end

  def update
    @owner = Owner.find_by(params[:id])
    if @owner.update(owner_params)
      redirect_to owners_path(@owner)
      # redirect_to owners_path, success: "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was updated successfully"
    else
      flash[:error] = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was not created successfully"
      # render 'edit'
    end
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owners_path
     else
      render :new
    end
  end
  
  def edit
    @owner = Owner.find_by(params[:id])
  end

  def destroy
    # p = params[:id]
    # message = nil
    # success_message = ""
    # error_message = ''
    @owner = Owner.find(params[:id])
    if @owner.destroy
      redirect_to owners_path
    else
      error_message = "owner not destroyed because something happened with #{params[:id]}"
      flash[:error] = error_message
      # redirect_to owners_path
    end 
    
      # end
      # if @owner.destroy
      #   success_message = "owner destroyed" 
      #   flash[:success] = success_message
      #   redirect_to owners_path
      # end
    
  end

  # this method takes in an owner and sets its first cats age to 23
  # def some_method_that_does_something(owner)
  #   cats = owner.cats
  #   cat = owner.cats.first
  #   cat.age = 22
  #   cat.save
  # end

  def create_a_cat(owner, cat_name, a, cat_fur_color, ec, food_type)
    cat = Cat.new(name: cat_name, age: a, fur_color: cat_fur_color, eye_color: ec, food_type: food_type)
    if cat && cat.valid?
      owner.cats << cat
    else
      puts "cat not valid"
    end
  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
      # if params[:owner]
      #   params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
      # end
    end
end
