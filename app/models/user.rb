require 'carrierwave'
require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :Match
  has_many :User, through: :Match
  
  
  #validates_presence_of   :avatar
  #validates_integrity_of  :avatar
  #validates_processing_of :avatar
  
  def getmatches
    User.find.all
  end
  
end
