class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # lists all of the current user's workouts
  def index
    @workouts = current_user.workouts
  end

  # renders the form to create a new workout
  def new
    @workout = Workout.new
  end

  # creates a new workout belonging to the current user
  def create
    @workout = Workout.new(user_id: current_user.id)
    @workout.update(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to controller: "workouts", action: "new"
    end
  end

  # shows the details of a specific workout
  def show
  end

  # renders a form to edit a specific workout
  def edit
  end

  # updates the workout
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # deletes the workout
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Workout was successfully deleted.' }
    end
  end

  private

  # finds a specific workout
  def set_workout
    @workout = Workout.find_by(id: params[:id])
  end

  def workout_params
    params.require(:workout).permit(:content, :calories_burned)
  end
end
