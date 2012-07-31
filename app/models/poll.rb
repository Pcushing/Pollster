class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name
  validates :name, :presence => true
  validates :edit_url, :uniqueness => true, :presence => true
  
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true
  
end
