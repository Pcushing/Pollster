class Answer < ActiveRecord::Base
  attr_accessible :question_id, :response_id, :text
  
  belongs_to :question;
  belongs_to :response;
end
