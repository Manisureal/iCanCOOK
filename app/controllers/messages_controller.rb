class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end

def index
  @messages = policy_scope(Message)
  @message = Message.new
 end

def new
 @message = Message.new
end

def create
 @message = Message.new(message_params)
 authorize @message
 @message.conversation = @conversation
 if @message.save
  redirect_to conversation_messages_path(@conversation)
 end
end

private
 def message_params
  params.require(:message).permit(:body, :user_id, :conversation_id)
 end
end
