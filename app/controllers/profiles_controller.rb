class ProfilesController < ApplicationController
  skip_before_action :user_profile?, only: %i[new create]
 

  def new
    @profile = Profile.new
  end

  def create 
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    current_user.profile_id = @profile.id
    if !@profile.avatar.attached?
      add_default_picture
    end
    if @profile.save!
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

  def add_default_picture 
    path = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
    @profile.avatar.attach(io: path, filename: "test-image.png", content_type: "image/png")
  end
end
  
