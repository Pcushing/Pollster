class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text
  validates_presence_of :poll_id, :text
  
  belongs_to :poll
  has_many :answers, :dependent => :destroy
  
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true
end
