class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name
    
  validates :name, :presence => true
  validates :edit_url, :uniqueness => true
  # validates :edit_url, :presence => true
  
  before_create :make_edit_url
  
  has_many :questions, :dependent => :destroy
  has_many :responses
  
  private
    def make_edit_url
      self.edit_url = SecureRandom.base64.gsub(/\W/,'')
    end
  
  # before_validation(:on => :create) do
    # self.edit_url  = SecureRandom.base64(10).gsub(/\W/,'')
    # self.edit_url = "haha"
  # end
end
