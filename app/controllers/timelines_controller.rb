class TimelinesController < ApplicationController
  skip_before_action :authenticate_user!
  around_action :catch_not_found, only: :show

  def show
    user = User.fetch(params[:user_id])
    @timeline = Timeline.new(user)

    if @timeline.viewable?(current_user)
      render
    else
      render_maintenance
    end
  end

  def project_popup
    @project = Project.fetch(params[:project_id])
  end

  def contact
    @user = User.fetch(params[:user_id])
    @sender_email =  params[:message][:email]
    @message_subject =  params[:message][:subject]
    @message_body =  params[:message][:body]

    @user.send_message(@sender_email, @message_subject, @message_body)
    @user.increase_message_counter
  end

  private

  def render_maintenance
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
