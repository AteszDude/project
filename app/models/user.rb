require 'carrierwave'
require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
    include ActionController::Helpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
#  has_many :matches
#  has_many :users, through: :matches

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  
  enum sex: { male: 0, female: 1 }
  enum sexuality: { heterosexual: 0, homosexual: 1, bisexual: 2}
  enum style: { metal: 0, gothic: 1, hardcore: 2, emo: 3, punk: 4}
  
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

  def getAge
    if(birth_date != nil)
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
    end
  end

  def getpotentials
    result = User.where("sex != ?", self.sex)
    result = result - getmatches
    result = result - [self]

    if(result.length > 4)
      result = result.sample(4)
    end
 
    return result
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
    likedpersons = []
    semimatches = Semimatch.where(person2_id: self.id)
      semimatches.each do |t|
      likedpersons = likedpersons + (User.where(id: t.person1_id))
     end
    return likedpersons
  end

  def testgetmatches()
    Match.last(20)
  end

  def testgetsemimatches()
    Semimatch.last(20)
  end
  
end
