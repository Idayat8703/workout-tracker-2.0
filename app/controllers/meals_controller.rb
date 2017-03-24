class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # lists all of the current user's meals
  def index
    @meals = current_user.meals
  end

  # shows a specific meal
  def show
  end

  # renders the form for a new meal. Two food items are built
  # so that the nested form for food items will be available.
  def new
    @meal = Meal.new
    @meal.food_items.build()
  end

  # the meal and food items making up the meal are created and saved
  # to the database
  def create
    @meal = Meal.create(user_id: current_user.id)
    @meal.update(meal_params)
    if @meal
      redirect_to meal_path(@meal)
    else
      redirect_to controller: "meals", action: "new"
    end
  end

  # renders the form to adit a meal
  def edit
  end

  # updates the meal and nested food items
  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      redirect_to controller: "meals", action: "new"
    end
  end

  # deletes a meal
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_path, notice: 'Meal was successfully deleted.' }
    end
  end

  private

  # finds the correct meal
  def set_meal
    @meal = Meal.find_by(id: params[:id])
  end

  def meal_params
    params.require(:meal).permit(:meal_type, food_items_attributes: [
      :name,
      :serving_size,
      :num_servings,
      :calories,
      :fat,
      :cholesterol,
      :sodium,
      :carbs,
      :protein
      ]
    )
  end
end

