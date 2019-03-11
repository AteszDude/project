class MatchController < ApplicationController
  def list
    @matches = Match.all
  end
  
  def show
   @match = Match.find(params[:id])
  end
  
  def match_params
   params.require(:books).permit(:person1_id, :person2_id)
  end  
  
  def new
    @match = Match.new(match_params)
  end
  
  def create
      if @match.save
         redirect_to :action => 'list'
      else
         render :action => 'new'
      end
  end
  
  def delete
      Match.find(params[:id]).destroy
      redirect_to :action => 'list'
  end
end
