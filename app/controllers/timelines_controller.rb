class TimelinesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.friendly.find(params[:user_id])
    @milestones = @user.milestones.load.order(date_start: :desc)
  end

  def show_overlay
    @milestone = Milestone.friendly.find(params[:milestone_id])
  end

  def contact
    @user = User.friendly.find(params[:user_id])
    @sender_email =  params[:message][:email]
    @message_body =  params[:message][:body]

    ContactMailer.contact_form_email(@user, @sender_email, @message_body).deliver_now
    @user.update(message_counter: @user.message_counter + 1)
    puts @user.message_counter
  end
end
