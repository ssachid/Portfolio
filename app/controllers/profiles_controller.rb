class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  layout "profile"

  def index
    @profile_items = Profile.all
  end

  def new
    @profile_item = Profile.new
    3.times { @profile_item.technologies.build }
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

  def edit
  end

  def update
    respond_to do |format|
      if @profile_item.update(profile_params)
        format.html { redirect_to profiles_path, notice: "Profile was successfully updated"}
      else
        format.html { render :edit }
      end
    end
  end

  def show

  end

  def destroy
    @profile_item.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile destroyed"}
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile_item = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
end
