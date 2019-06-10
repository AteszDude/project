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

  def getAge
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end

  def getpotentials
    #TODO rewrite
    result = User.where("sex != ?", self.sex)
    result = result - getmatches
    result = result - [self]
    if(result.length > 4)
      result = result.sample(4)
    end
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

  # Setup accessible (or protected) attributes for your model
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end  
  
end
