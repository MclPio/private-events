class AttendancesController < ApplicationController
  before_action :user_invited!, only: [:new, :create]
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
      flash[:notice] = 'Signed up for event'
      redirect_to event_url(@attendance.event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = current_user.attendances.find_by(event_id: event_params)
    @attendance.destroy

    flash[:notice] = 'Event attendance cancelled'
    redirect_to event_url(@attendance.event), status: :see_other
  end

  private

  def event_params
    params.require(:id)
  end

  def user_invited!
    @event = Event.find(event_params)

    unless current_user.invited_events.include?(@event)
      redirect_to root_path, alert: 'You are not invited to this event'
    end
  end
end
