class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(info_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def info_params
    params.require(:user).permit(:username, :image, :first_name, :last_name, :location, :phone, :description, :bio, :blog, skills_attributes: [:id, :name, :_destroy], social_media_links_attributes: [:id, :name, :url, :_destroy]
      )
  end
end
