class SemimatchController < ApplicationController
  def list
    @matches = Semimatch.all
  end
  
  def show
   @match = Semimatch.find(params[:id])
  end
  
  def semimatch_params
   params.require(:semimatches).permit(:person1_id, :person2_id)
  end  
  
  def create
     #Semimatch already exists
    if(Semimatch.exists?(params[:semimatch]))
      return nil

    #We have a match
    elsif(Semimatch.exists?(person1_id: params[:person2_id], person2_id: params[:person1_id]))
    Semimatch.find_by(person1_id: params[:person2_id], person2_id: params[:person1_id]).delete
    Conversation.create(:user1_id => params[:person1_id],
          :user2_id => params[:person2_id])
    match = Match.create(:person1_id => params[:person1_id],
          :person2_id => params[:person2_id], :time => Time.now)
    match.save

    return nil

    #Create new semi match
    else
          match = Semimatch.new(:person1_id => params[:person1_id],
          :person2_id => params[:person2_id], :time => Time.now)
          match.save
    end
  end
  
  def delete
      Semimatch.find(params[:id]).destroy
      redirect_to :action => 'list'
  end
end
