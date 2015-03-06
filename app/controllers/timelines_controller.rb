class TimelinesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @milestones = @user.milestones.all
  end

  def contact
    @user = User.find(params[:user_id])
    @sender_name =  params[:message][:name]
    @sender_email =  params[:message][:email]
    @message_body =  params[:message][:body]

    ContactMailer.contact_form_email(@user, @sender_name, @sender_email, @message_body).deliver_now

  end

end
