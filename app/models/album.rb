class Album < ActiveRecord::Base
  attr_accessor :images_count, :name, :user_id

  
  
  has_many :photos, :dependent => :destroy
  belongs_to :user, optional: true
  
  #Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end