class ChartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:linechart]
  # /chart?user_id=4
  # /chart?token=8Ynxp2XAwVoO3zbVe22itQ
  def linechart
    if params[:token].blank?
      set_calories(current_user)
    else
      user = User.find_by(token: params[:token])
      if user == nil
        redirect_to new_user_session_path, alert: 'Invalid URL'
        return
      end
      set_calories(user)
    end
  end

  def share_chart
    recipient = params[:email]
    link = params[:link]

    ChartMailer.share_chart(recipient, link).deliver_now

    redirect_to root_path, notice: "Email sent successfully!"
  end

  private
    def set_calories(user)
      @calories_burned = user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: true).group_by_day(:date).sum(:calories)
      @calories_consumed = user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: false).group_by_day(:date).sum(:calories)
    end
end
