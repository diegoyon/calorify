class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ edit update destroy ]
  load_and_authorize_resource

  def index
    @activities = current_user.activities.order(date: :desc).page(params[:page])
    search_activities
    filter_from
    filter_to

    @consumed = current_user.activities.where(date: Date.current, burned: false).sum(:calories)
    @burned = current_user.activities.where(date: Date.current, burned: true).sum(:calories)
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] = "Activity was successfully created."
      redirect_to activities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      flash[:notice] = "Activity was successfully updated."
      redirect_to activities_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    flash[:notice] = "Activity was successfully deleted."
    redirect_to activities_url
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:calories, :burned, :description, :date).with_defaults(user_id: current_user.id)
    end

    def search_activities
      return unless params[:query].present?
      @activities = @activities.where('lower(description) LIKE :query', query: "%#{params[:query].downcase}%")
    end

    def filter_from
      return unless params[:from_date].present?
      @activities = @activities.where("date >= ?", params[:from_date])
    end

    def filter_to
      return unless params[:to_date].present?
      @activities = @activities.where("date <= ?", params[:to_date])
    end
end
