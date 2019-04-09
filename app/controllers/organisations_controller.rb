class OrganisationsController < ApplicationController
  before_action :check_session
  
  def new
    @organisation = Organisation.new
    @organisation = Organisation.create(organisation_params)
    if @organisation.valid?
      @organisation.save
      flash[:success] = 'Organisation successfully created.'
      update_user(@organisation.id)
      redirect_to "/home"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find_by_id(params[:id])
    if @organisation.update(organisation_params)
      flash[:success] = "Organisation " + params[:id] + " updated."
      redirect_to '/home'
    end
  end

  def removeOrganisation(organisation_id)
    @user = User.find_by_id(session[:user_id])
    #@user.organisation_id = organisation_id
    @user.update(organisation_id: organisation_id)
  end

  private 
  
  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def check_session
    if !session[:user_id]
      redirect_to '/'
    end
  end

  def update_user(id)
    @user = User.find(session[:user_id])
    @user.update(organisation_id: id)
  end
end
