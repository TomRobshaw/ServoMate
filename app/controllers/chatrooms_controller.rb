class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = params[:id]
  end
end
