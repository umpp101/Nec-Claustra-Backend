class AuthController < ApplicationController

    skip_before_action :authorized, only: [:create]
   
    def create
    
      @user = User.find_by(user_name: user_login_params[:user_name])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    def re_auth
      render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end
   
    private
   
    def user_login_params
      params.require(:user).permit(:user_name, :password)
    end

  end