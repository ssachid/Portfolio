class ProfilesController < ApplicationController
  def index
    @profile_items = Profile.all
  end
end
