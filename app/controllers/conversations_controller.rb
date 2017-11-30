class ConversationsController < ApplicationController
 before_action :authenticate_user!

def index
 @conversations = policy_scope(Conversation)
 @users = User.all
 if @conversations.empty?
  @no_conversation = true
  end
 end

def create
 if Conversation.between(params[:user_id],current_user)
   .present?
    @conversation = Conversation.between(params[:user_id],
     current_user).first
    authorize @conversation
 else
  @conversation = Conversation.create(recipient_id: params[:user_id], sender_id: current_user.id)
  authorize @conversation
 end
 redirect_to conversation_messages_path(@conversation)
end

private
 def conversation_params
  params.permit(:sender_id, :recipient_id, :user_id)
 end
end
