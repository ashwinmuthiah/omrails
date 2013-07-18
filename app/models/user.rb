class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable
         :rememberable, :trackable, :validatable
  # Below was commented out. Uncommented and added :password, 
  #:password_confirmation, :email to avoid MassAssignment Security Error
  attr_accessible :password, :password_confirmation, :email, :remember_me, :name

  #different relationships at rails associtaions
  has_many :pins, :dependent => :destroy
end
