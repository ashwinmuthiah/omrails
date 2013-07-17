class Pin < ActiveRecord::Base
  attr_accessible :description
  #Validates a pin before it can be created. At least must be present, etc.
  #See more validations at rails validations on google
  validates :description, presence: true
end
