class SessionsController < ApplicationController
  def index
  end

  def register
    @user = User.new
  end
  
  def new
    @user = User.create(user_params)
    @user.organisation_id=1

    if @user.valid?
      session[:user_id] = @user[:id]
      @user.save
      redirect_to "/home"
    else
      #flash[:notice] = 'Invalid input.'
      flash[:errors] = @user.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def login
    @user = User.find_by_email_address(params[:email_address])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user[:id]
      redirect_to "/home"
    else
      flash[:notice] = "Invalid crenentials. Please try again."
      redirect_back(fallback_location: root_path)
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to '/'
  end

  def user_params
    params.require(:user).permit(:name,:email_address,:password,:password_confirmation)
  end
end
