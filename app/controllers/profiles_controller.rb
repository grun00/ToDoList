class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: %i[show edit update change_privacy]
  before_action :public?
 
  def show 
  end

  def new
    @profile = Profile.new
  end

  def create 
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    current_user.profile_id = @profile.id
    if @profile.save
      flash[:alert] = 'Profile Created!'
      redirect_to @profile
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @profile.update(profile_params)
      flash[:alert] = 'Task Updated!'
      redirect_to @profile
    else
      render :edit
    end 
  end

  def change_privacy
    @profile.update(privacy_params)
    redirect_to @profile
  end

  private 

  def profile_params
    params.require(:profile).permit(:nickname, :bio, :avatar, :user_id)
  end 

  def privacy_params
    params.require(:profile).permit(:share)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def public?
    unless (current_user.profile == @profile)
      unless @profile.share
        redirect_to root_path
      end
    end
  end

end
  
