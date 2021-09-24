class RoomsController < ApplicationController
 
 before_action :set_search
 before_action :authenticate_user, {only: [:new, :create]}
 
  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: @room.user_id)
    @reservation = Reservation.new
  end
  
  def register
    @rooms = Room.where(user_id: @current_user.id)
  end
  
  def new
    @room = Room.new 
  end
  
  def create
      @room = Room.new(room_params)
      @room.user_id = @current_user.id
      if @room.save
        redirect_to(rooms_path)
        flash[:notice] = "部屋を新規登録しました"
      else
        render "rooms/new"
      end
  end

  private
  
    def room_params
       params.require(:room).permit(:name, :introduction, :address, :price, :image) 
    end
  
end
