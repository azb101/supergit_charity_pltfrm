class Donation < ActiveRecord::Base
  attr_accessible :amount, :date, :user_id, :donator_id
  
  validates :amount, :presence => true, :length => {:minimum =>1 }
  
end
