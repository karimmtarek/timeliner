class TimelinesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    @milestones = @user.milestones.all
  end

  def contact
    puts params[:message][:body]


  end

end
