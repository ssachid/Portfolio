class ProfilesController < ApplicationController
  def index
    @profile_items = Profile.all
  end

  def new
    @profile_item = Profile.new
  end

  def create
    @profile_item = Profile.new(profile_params)
    respond_to do |format|
      if @profile_item.save
        format.html { redirect_to profiles_path, notice: "Your profile is now live."}
      else
        format.html { render :new }
      end
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:title, :subtitle, :body)
  end
end
