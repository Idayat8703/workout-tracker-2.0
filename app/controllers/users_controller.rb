class UsersController < ApplicationController
  # renders the profile page for a user.
  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end

  # renders the form to update user information such as name, height, etc.
  def edit

  end

  # updates the user information
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path(current_user), notice: 'Your profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :age,
      :weight,
      :height_in_inches
    )
  end
end
