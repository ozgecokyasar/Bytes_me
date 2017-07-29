class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params


    if @user.save
      session[:user_id] = @user.id

      redirect_to home, notice: 'Thank you for singing up'
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new
    end

  end



  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end




end
