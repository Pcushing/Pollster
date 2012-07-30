class User < ActiveRecord::Base
  attr_accessible :session_cookie
  validates :session_cookie, :uniqueness => true, :presence => true
end
