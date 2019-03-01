class VisitorsController < ApplicationController

  #Ajax request after pressing the like buton 
  def like()
  #Copied content
  @content = Content.find(params[:id])
  @content.liked_by current_user

  if request.xhr?
    head :ok
  else
    redirect_to @content
  end

  end
  
  #Ajax request after pressing the dislike buton 
  def dislikebutton()
  end
  
end
