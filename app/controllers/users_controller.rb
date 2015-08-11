class UsersController < ApplicationController
  def show
    @user = User.fetch(params[:id])
  end

  def edit
    @user = User.fetch(params[:id])
  end

  def update
    @user = User.fetch(params[:id])

    if @user.update(info_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def maintenance_mode
    if current_user.maintenance_mode
      current_user.update(maintenance_mode: false)
    else
      current_user.update(maintenance_mode: true)
    end
  end

  private

  def info_params
    params.require(:user).permit(:username, :image, :first_name, :last_name, :location, :phone, :description, :bio, :blog_url, :available, :availability_message, skills_attributes: [:id, :name, :_destroy], social_media_links_attributes: [:id, :name, :url, :_destroy]
      )
  end
end
