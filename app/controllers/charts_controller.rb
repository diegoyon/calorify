class ChartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:linechart]
  # /chart?user_id=4
  def linechart
    if params[:user_id].present?
      current_user = User.find_by(id: params[:user_id])
      if current_user == nil
        redirect_to new_user_session_path, alert: 'Invalid URL'
        return
      end
    end
    @calories_burned = current_user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: true).group_by_day(:date).sum(:calories)
    @calories_consumed = current_user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: false).group_by_day(:date).sum(:calories)
  end
end
