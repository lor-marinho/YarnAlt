class ChatroomsController < ApplicationController
  def show
    # chatroom igual ao yarn id
    @chatroom = Chatroom.find(params[:id])
    @yarn = @chatroom.yarn
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @yarn = Yarn.find(params[:yarn_id])
    new
    @chatroom.yarn = @yarn
    @chatroom.name = @yarn.name

    if @chatroom.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end
end
