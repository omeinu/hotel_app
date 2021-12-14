class ReservationsController < ApplicationController
 
  before_action :set_search
  before_action :authenticate_user
    
  def index
    @reservations = Reservation.where(user_id: @current_user.id)
  end
  
  def create
    @user = User.find_by(id: @current_user.id)
    @reservation = Reservation.new(reservation_params)  
    if @reservation.save
      redirect_to("/")
    else
      render 'rooms/show'
    end
  end
  
  private
    
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :people, :room_id).merge(user_id: @current_user.id)
    end
    
end
