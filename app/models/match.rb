class Match < ApplicationRecord
  belongs_to :User, :class_name => 'person1'
  belongs_to :User, :class_name => 'person2'
  
  def create
    
  end
  
end
