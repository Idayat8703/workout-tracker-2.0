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
    if @meal.save
        flash[:notice] = "Meal was successfully created"
      redirect_to user_meal_path(current_user, @meal)
    else
      flash[:error] = "Please update complete the form"
      redirect_to controller: "meals", action: "new"
    end

  end

  # updates the meal and nested food items
  def update
    if @meal.update(meal_params)
        flash[:notice] = "Workout Plan was successfully updated"
      redirect_to user_meal_path(current_user, @meal)
    else
      flash[:error] = "Please update complete the form"
      redirect_to controller: "meals", action: "new"
    end
  end

  # deletes a meal
    def destroy
      @meal.destroy
         redirect_to user_path(current_user), notice: 'Meal was successfully deleted.'
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
      ]
    )
  end
end
