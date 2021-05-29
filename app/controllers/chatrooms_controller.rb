class ChatroomsController < ApplicationController
  def show
    # chatroom igual ao yarn id
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
