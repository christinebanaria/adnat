class ShiftsController < ApplicationController
  before_action :check_session

  def all
    @shifts = Shift.all.order(:start)
    @user = User.find(session[:user_id])
    print(@user.name[0..2])
    @users = User.all
    @organisation = Organisation.find(@user.organisation_id)
  end

  def new
    @shift = Shift.new
    @shift.user_id = session[:user_id]
    @shift.start = getStart
    @shift.finish = getEnd
    @shift.break_length = params[:break_length]
    if @shift.save
      flash[:success] = 'Shift has been saved.'
    else
      flash[:errors] = @shift.errors.full_messages
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find_by_id(params[:id])
    @shift.start = getStart
    @shift.finish = getEnd
    @shift.break_length = params[:break_length]
    if @shift.update()
      flash[:success] = "Organisation " + params[:id] + " updated."
      redirect_to '/home'
    end
  end

  private

  def check_session
    if !session[:user_id]
      redirect_to '/'
    end
  end

  def getStart
    @start = params[:date] + " " + params[:start]
  end

  def getEnd
    @end = params[:date] + " " + params[:end]
  end

  def overnight?
    @startTime = params[:start].to_time
    @endTime = params[:end].to_time

    if @startTime.to_i > @endTime.to_i
      true
    else
      false
    end
  end

end
