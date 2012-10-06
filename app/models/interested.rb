class Interested < ActiveRecord::Base
  attr_accessible :email_address, :ip
  validates :email_address, :presence => true, :email => true
end
