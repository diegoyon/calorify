class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:linechart]

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
    if recipient.empty?
      redirect_to chart_path, alert: "Type an email"
      return
    end
    user = current_user

    ChartMailer.share_chart(recipient, user).deliver_now

    redirect_to chart_path, notice: "Email sent successfully!"
  end

  def profile
  end

  def reset_token
    current_user.update_attribute(:token, SecureRandom.urlsafe_base64)
    redirect_to profile_path, notice: "Token has been reset successfully!"
  end

  private
    def set_calories(user)
      @calories_burned = user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: true).group_by_day(:date).sum(:calories)
      @calories_consumed = user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: false).group_by_day(:date).sum(:calories)
    end
end
