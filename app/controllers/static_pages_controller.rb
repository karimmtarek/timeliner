class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def auth_failure
  end
end
