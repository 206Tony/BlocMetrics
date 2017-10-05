class RegisteredApplicationsController < ApplicationController
  before_action :require_sign_in
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.name = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "Application registered successfully"
      redirect_to [@registered_application]
    else
      flash[:alert] = "Failed to regiater Application"
      redirect_to :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.update_attributes(registered_application_params)
      flash[:notice] = "Successfully updated \"#{@registered_application.name}\"."
      redirect_to registered_applications_path
    else
      flash[:error] = "Failed to update Application"
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" deleted successfully"
      redirect_to registered_applications_path
    else
      flash[:alert] = "Failed to delete Application" 
      render :show
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

  def require_sign_in 
    unless current_user
      flash[:alert] = "You must sign in to do that!"
      redirect_to root_path
    end
  end
end
