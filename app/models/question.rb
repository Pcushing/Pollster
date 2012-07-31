class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text
  validates_presence_of :poll_id, :text
  
  belongs_to :poll
  has_many :answers, :dependent => :destroy
end
