class VisitorsController < ApplicationController

  #Ajax request after pressing the like buton 
  def like()
    Rails.logger = Logger.new(STDOUT)
    logger.debug "CREATING NEW SEMI MATCH!"

  #Use redirect_to semimatch controller
  redirect_to "semimatch"

    Match.create(:person1_id => params[:person1_id], :person2_id => params[:person2_id], :time => Time.now)
  end
  
  #Ajax request after pressing the dislike buton 
  def dislikebutton()
  end

end
