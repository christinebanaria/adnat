class ShiftsController < ApplicationController
  before_action :check_session

  def all
    @shifts = Shift.all
    @user = User.find(session[:user_id])
    print(@user.name[0..2])
    @users = User.all
  end

  def create
  end

  def check_session
    if !session[:user_id]
      redirect_to '/'
    end
  end
end
