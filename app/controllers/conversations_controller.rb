class ConversationsController < ApplicationController
# before_action :authenticate_user

 def index
 @users = User.all
 @conversations = Conversation.all
 @blog_posts = BlogPost.all
 render :template => "conversations/index"
 end

def create
 if Conversation.between(params[:user1_id],params[:user2_id])
   .present?
    @conversation = Conversation.between(params[:user1_id],
     params[:user2_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end

 redirect_to conversation_messages_path(@conversation)

end


def getMessages
 @messages = @conversation.messages
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
 if @messages.last
  if @messages.last.user_id != current_user.id
   @messages.last.read = true;
  end
 end
end

def show
 render :template => "conversations/index"
end


private
 def conversation_params
  params.permit(:user1_id, :user2_id)
 end

end