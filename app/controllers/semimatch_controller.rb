class UnmatchController < ApplicationController
  def list
    @unmatches = Unmatch.all
  end
  
  def show
   @unmatch = Unmatch.find(params[:id])
  end
  
  def unmatch_params
   params.require(:semimatches).permit(:person1_id, :person2_id)
  end  
  
  def create
     #Delete all semimatches and matches
  end
  
  def delete
     #Not needed to implement
  end
end
