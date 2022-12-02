class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = Chatroom.find params[:id]
    garage_id = @chatroom.name.split("_")[1]
    @garage = Garage.find(garage_id)
  end
end
