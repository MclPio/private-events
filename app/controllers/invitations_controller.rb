class InvitationsController < ApplicationController
  before_action :authenticate_user!, :authorize_user!

  def new
    @invitation = Invitation.new
  end
  
  def create
    @event = Event.find(invitation_params[:event_id])
    @user = User.find_by(username: invitation_params[:username])
    @invitation = @event.invitations.new(user: @user)

    if @invitation.save
      redirect_to @event
    else
      flash[:alert] = "Invitation failed... " + @invitation.errors.full_messages.join(', ')
      redirect_to @event
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:username).merge(event_id: params.dig(:event, :id))
  end

  def authorize_user!
    @event = Event.find(invitation_params[:event_id])

    unless @event.creator == current_user
      redirect_to @event, alert: 'You are not authorized to perform this action'
    end
  end
end
