class Match < ApplicationRecord
  belongs_to :person1, :class_name => 'User', required: true
  belongs_to :person2, :class_name => 'User', required: true

end
