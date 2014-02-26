class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "You created a recipe yo"
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "There is something wrong yo"
      render :new
    end    
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Updated recipe yo"
      redirect_to recipe_path(recipe.id)
    else
      flash[:error] = "Cant update yo"
      render :edit  
   end
  end 

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Your recipe was destroyed yo"
    redirect_to recipes_path
  end

end

private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cook_time, :ingredients, :instructions, :picture)
  end
  
