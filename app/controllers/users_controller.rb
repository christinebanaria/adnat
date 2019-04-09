class UsersController < ApplicationController
  before_action :check_session

  def home
    @user = User.find_by_id(session[:user_id])
    @organisations = Organisation.all
    @organisation = Organisation.find_by_id(@user.organisation_id)
  end

  def leaveOrganisation
    User.where(id: session[:user_id]).update(organisation_id: 1)
    flash[:success] = 'You have left the organisation.'
    redirect_back(fallback_location: root_path)
  end

  def joinOrganisation
    User.where(id: session[:user_id]).update(organisation_id: params[:id])
    flash[:success] = 'You have joined the organisation.'
    redirect_back(fallback_location: root_path)
  end


  private


  def check_session
    if !session[:user_id]
      redirect_to '/'
    end
  end
end
