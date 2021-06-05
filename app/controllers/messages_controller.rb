class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # send to the channel

      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "shared/message", locals: { message: @message })
      )
      # redirect_back(fallback_location: root_path)
        redirect_to chatroom_path(@chatroom, anchor: "message-#{message.id}")
    else
      render "chatrooms/show"
    end
  end

  def destroy
    message = Message.find(params[:id])
    chatroom = message.chatroom
    yarn = chatroom.yarn
    message.destroy
    # authorize @message
    redirect_to yarn_chatroom_path(yarn, chatroom)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
