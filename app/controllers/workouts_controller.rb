class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # lists all of the current user's workouts
  def index
     @workouts = current_user.workouts
     @beginner_workout =current_user.workouts.beginner
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
       flash[:notice] = "Workout Plan was successfully created"
       redirect_to user_workout_path(current_user, @workout)
     else
       flash[:error] = "Please update complete the form"

       redirect_to new_user_workout_path(current_user, @workout)
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
        if @workout.update(workout_params)
          flash[:notice] = "Workout Plan was successfully created"
            redirect_to user_workout_path(current_user, @workout)

        else
          flash[:error] = "Please update complete the form"
        redirect_to edit_user_workout_path(current_user, @workout)
      end
  end

  # deletes the workout
  def destroy
      @workout.destroy
      redirect_to user_path(current_user), notice: 'Workout was successfully deleted.'
      end


  private

  # finds a specific workout
  def set_workout
    @workout = Workout.find_by(id: params[:id])
  end

  def workout_params
    params.require(:workout).permit(:content, :calories_burned, :favorites)
  end
end
