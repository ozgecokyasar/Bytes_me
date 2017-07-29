class SessionsController < ApplicationController



  def new
  end


  def create

    user = User.find_by(email: params[:email])




    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in Successfuly"
      redirect_to home_path

    else
      flash.now[:alrt] = 'Wrong email or password'
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to home, notice: 'signed out!!'
  end



end
