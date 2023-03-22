class ChartsController < ApplicationController
  def linechart
    @calories_burned = current_user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: true).group_by_day(:date).sum(:calories)
    @calories_consumed = current_user.activities.where("date >= ?", 30.days.ago.to_date).where(burned: false).group_by_day(:date).sum(:calories)
  end
end
