class ProfilesController < ApplicationController
 
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

  def show 
    find_profile
  end

  private 

  def profile_params
    params.require(:profile).permit(:nickname, :bio, :avatar, :user_id)
  end 

  def find_profile
    @profile = Profile.find(params[:id])
  end

end
  
