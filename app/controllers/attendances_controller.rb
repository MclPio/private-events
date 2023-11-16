class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.build(attendance_params)

    if @attendance.save
      redirect_to @attendance
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
