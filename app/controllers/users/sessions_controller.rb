class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end


  def create_with_oauth
    binding.pry

    if User.where(email: info['info']['email']).present?
      redirect_to user_session_path, notice: 'What is wrong with you? you already signed up!! sign in below if you want.'
      return false
    end

    @user = User.create(
      email:    info['info']['email'],
      username: info['info']['name'],
      password: 'password',
    )

    @user_info = Information.create(
      user_id: @user.id,
      uid:         info['uid'],
      token:       info['credentials']['token'],
      secret:      info['credentials']['secret'],
      first_name:  info['info']['first_name'],
      last_name:   info['info']['last_name'],
      location:    info['info']['location'],
      description: info['info']['description'],
      phone:       info['info']['phone']
    )

    sign_in @user
    redirect_to personal_info_path
  end

  # POST /resource/sign_in
  def create
    super
    redirect_to personal_info_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def info
    request.env['omniauth.auth']
  end

end
