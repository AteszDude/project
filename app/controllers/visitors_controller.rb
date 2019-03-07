class VisitorsController < ApplicationController

  #Ajax request after pressing the like buton 
  def like()
    Rails.logger = Logger.new(STDOUT)
    logger.debug "CREATING NEW MATCH!!!!!!!!!!"
    logger.debug "param: " + params[:person2_id] 


    Match.create(:person1_id => params[:person1_id], :person2_id => params[:person2_id], :time => Time.now)
  end
  
  #Ajax request after pressing the dislike buton 
  def dislikebutton()
  end

end
