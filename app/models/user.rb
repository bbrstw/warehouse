class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :unless => :has_name?
  validates_presence_of :last_name, :unless => :has_name?
         
  mount_uploader :image, ImageUploader
  
  def has_name?
    first_name? || last_name?
  end
  
end
