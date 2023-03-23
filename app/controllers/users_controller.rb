class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: "Calorie goal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:calorie_goal)
  end
  
end
