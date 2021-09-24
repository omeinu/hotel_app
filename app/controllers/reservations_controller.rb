class ReservationsController < ApplicationController
 
  before_action :set_search
  before_action :authenticate_user
    
    def index
      @reservations = Reservation.where(user_id: @current_user.id)
    end
    
    def create
      @room = Room.find_by(id: params[:room_id])
      @user = User.find_by(id: @current_user.id)
      @reservation = Reservation.new(
          room_id: params[:room_id], 
          user_id: @current_user.id, 
          start_date: params[:start_date],
          end_date: params[:end_date],
          people: params[:people]
          )  
      if @reservation.save
         redirect_to("/")
     else
         render 'rooms/show'
     end
    end
  
  
end
