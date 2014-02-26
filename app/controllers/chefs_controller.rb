class ChefsController < ApplicationController

  def new
    @chef = Chef.new
  end
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "New Chef added yo!"
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "Cant save chef yo, for some reason"
      render :new
    end   
  end

  def show
    @chef = Chef.find(params[:id])
  end
  
  def edit
    @chef = Chef.find(params[:id])
  end
  def update
    @chef = Chef.find(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:success] = "Chef updated yo"
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "Cant update chef yo"
      render :edit
    end    
  end

  def destroy
    @chef = Chef.find(params[:id])
    @chef.destroy
    flash[:notice] = "Chef has been destroyed yo"
    redirect_to chefs_path
  end

  def index
    @chefs = Chef.all
  end  

end

private

  def chef_params
    params.require(:chef).permit(:name, :show, :specialty, :avatar)
  end