class RegistrationsController < ApplicationController
  
  before_filter :set_event
  before_filter :require_signup, :only => [:new]

  def new
    @registration = Registration.new(:registrant_name => current_user.name, :registrant_email => current_user.email)
  end
  
  def create
    @registration = Registration.new(params[:registration])
    @registration.event_id = @event.id
    
    if @registration.save
      redirect_to @event
    else
      # aughhh
    end
  end
  
  private
  
  def set_event
    @event = Event.find(params[:event_id])
  end
  
end
