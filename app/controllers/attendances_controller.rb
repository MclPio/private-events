class AttendancesController < ApplicationController
#implement before action to make sure a user is signed in before utilizing any of these methods
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
  end

  def index
    @attendances = Attendance.all
  end

  def create
    @attendance = current_user.attendances.build(event_id: event_params)

    if @attendance.save
      redirect_to event_url(@attendance.event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event_id)
  end
end
