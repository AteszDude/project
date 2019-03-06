class VisitorsController < ApplicationController

  #Ajax request after pressing the like buton 
  def like()
    Rails.logger = Logger.new(STDOUT)
    logger.debug "CREATING NEW MATCH!!!!!!!!!!"

    Match.create(:person1_id => 2, :person2_id => 6, :time => Time.now)
  end
  
  #Ajax request after pressing the dislike buton 
  def dislikebutton()
  end

end
