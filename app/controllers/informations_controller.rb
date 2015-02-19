class InformationsController < ApplicationController
  def show
    @user = current_user
    @user_info = @user.information
    # byebug
  end
end
