class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :user_invited!, only: [:show]

  def index
    if params[:q].present?
      @events = Event.where("title ILIKE ?", "%#{params[:q]}%")
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = 'Event updated'
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    flash[:notice] = 'Event deleted'
    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date_start, :date_end, :q)
  end

  def authorize_user!
    @event = Event.find(params[:id])

    unless @event.creator == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action'
    end
  end

  def user_invited!
    @event = Event.find(params[:id])

    if user_signed_in?
      unless current_user.invited_events.include?(@event) || current_user == @event.creator
        redirect_to root_path, alert: 'You are not invited to this event'
      end
    else
      redirect_to root_path, alert: 'You are not invited to this event'
    end
  end
end
