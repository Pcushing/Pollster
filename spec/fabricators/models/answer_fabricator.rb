Fabricator(:answer) do
  text { Faker::Lorem.sentence(10) }
  question_id 2
  response_id 2
end

Fabricator(:answer_from_response, :from => :answer) do
  response_id { Fabricate(:response) }
end

Fabricator(:answer_from_question, :from => :answer) do
  question_id { Fabricate(:question) }
end

