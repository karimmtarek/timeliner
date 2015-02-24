class AccountsController < ApplicationController
  def show
    @account = current_user
  end

  def edit
    @account = current_user
    # binding.pry
  end

  def update
    @account = current_user

    if @account.update(info_params)
      redirect_to account_path
    else
      render :edit
    end

  end

  private

  def info_params
    params.require(:user).permit(:username, :image, :first_name, :last_name, :location, :phone, :description)
  end
end
