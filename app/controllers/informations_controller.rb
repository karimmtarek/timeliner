class InformationsController < ApplicationController
  def show
    @information = current_user
  end

  def edit
    @information = current_user
    # binding.pry
  end

  def update
    @information = current_user

    if @information.update(info_params)
      redirect_to information_path
    else
      render :edit
    end

  end

  private

  def info_params
    params.require(:user).permit(:username, :image, :first_name, :last_name, :location, :phone, :description)
  end
end
