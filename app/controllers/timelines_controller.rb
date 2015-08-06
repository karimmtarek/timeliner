class TimelinesController < ApplicationController
  skip_before_action :authenticate_user!
  around_action :catch_not_found, only: :index

  def index
    @user = User.friendly.find(params[:user_id])

    return maintenance if @user.maintenance_mode && !current_user

    @milestones = @user.milestones.load.order(date_start: :desc)
  end

  def project_popup
    @project = Project.friendly.find(params[:project_id])
  end

  def contact
    @user = User.friendly.find(params[:user_id])
    @sender_email =  params[:message][:email]
    @message_subject =  params[:message][:subject]
    @message_body =  params[:message][:body]

    @user.send_message(@sender_email, @message_subject, @message_body)
    @user.increase_message_counter
  end

  private

  def maintenance
    flash[:error] = 'This timeline is in maintenance mode'
    render :maintenance
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "We could't find that user"
    render :user_not_found
  end
end
