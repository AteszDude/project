require 'carrierwave'
require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
#  has_many :matches
#  has_many :users, through: :matches
  
  #validates_presence_of   :avatar
  #validates_integrity_of  :avatar
  #validates_processing_of :avatar
  
  #TODO: refactor  
  def getmatches
    allpersons = []
    allmatches = Match.where(person1_id: self.id)
     allmatches.each do |t|
       allpersons = allpersons + (User.where(id: t.person2_id))
     end
     
  allmatches = Match.where(person2_id: self.id)
     allmatches.each do |t|
       allpersons = allpersons + (User.where(id: t.person1_id))
     end
     
     return allpersons
  end

  def getpotentials
    allusers = User.all
    allusers = allusers - getmatches
    allusers = allusers - [self]
  end

  def getsentlikes
    likedpersons = []
    semimatches = Semimatch.where(person1_id: self.id)
      semimatches.each do |t|
      likedpersons = likedpersons + (User.where(id: t.person2_id))
     end
    return likedpersons
  end


  def getlikedby
    Semimatch.where(person2_id: self.id)
  end

  def testgetmatches()
    Match.last(20)
  end

  def testgetsemimatches()
    Semimatch.last(20)
  end

  
end
