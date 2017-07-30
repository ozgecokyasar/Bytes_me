class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.registration_confirmation(@user).deliver

      redirect_to "/", notice: 'Thank you for singing up, please confirm your email address'
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new
    end

  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      session[:user_id] = user.id
      flash[:notice] = "Logged in Successfuly"
      redirect_to home_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,:username,
      :password, :password_confirmation)
  end




end
