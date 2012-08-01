class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name
  
  validates :name, :presence => true
  validates :edit_url, :uniqueness => true, :presence => true
  
  has_many :questions, :dependent => :destroy
  has_many :responses
  
  before_validation(:on => :create) do
    self.edit_url  = SecureRandom.base64(10).gsub(/\W/,'')
  end
end
