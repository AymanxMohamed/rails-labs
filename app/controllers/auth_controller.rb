class AuthController < ApplicationController
  before_action :authenticated_user, except: [:logout]


  def signup_form
    @user = User.new
  end

  def signup

    @user  = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))

    @user.valid? # => check if the user is valid
    # puts @user.errors

    puts "---------------------"
    # convert user erros to json
    puts @user.errors[:name]
    puts "---------------------"

    return redirect_to root_path if @user.save 

    render 'auth/signup_form'

    # redirect_back fallback_location: register_auth

  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      return redirect_to root_path
    end
    redirect_back fallback_location: login_path
  end

  def signin_form
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end
