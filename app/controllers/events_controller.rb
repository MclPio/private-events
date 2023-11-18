class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
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

    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date_start, :date_end)
  end

  def authorize_user!
    @event = Event.find(params[:id])

    unless @event.creator == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action'
    end
  end
end
