class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end


  def create_with_oauth
    # binding.pry

    if User.where(email: auth_hash['info']['email']).present?
      @user = User.find_by(email: auth_hash['info']['email'])
      sign_in @user
      redirect_to personal_info_path, notice: "Welcome back #{@user.username}"
      return false
    end

    @user = User.create(
      email:    auth_hash['info']['email'],
      username: auth_hash['info']['name'],
      password: SecureRandom.hex(10)
    )

    @user_info = Information.create(
      user_id: @user.id,
      uid:         auth_hash['uid'],
      token:       auth_hash['credentials']['token'],
      secret:      auth_hash['credentials']['secret'],
      first_name:  auth_hash['info']['first_name'],
      last_name:   auth_hash['info']['last_name'],
      location:    auth_hash['info']['location'],
      description: auth_hash['info']['description'],
      phone:       auth_hash['info']['phone']
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

  def auth_hash
    request.env['omniauth.auth']
  end

end
