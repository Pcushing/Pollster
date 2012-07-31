class Response < ActiveRecord::Base
  attr_accessible :poll_id
  
  belongs_to :poll;
  has_many :answers, :dependent => :destroy
end
