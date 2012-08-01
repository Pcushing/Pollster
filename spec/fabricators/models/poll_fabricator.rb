Fabricator(:poll) do
  name { Faker::Lorem.sentence(2) }
end

Fabricator(:poll_with_questions, :from => :poll) do
  questions(:count => 3){|poll, index| Fabricate(:question, :poll_id => poll)}
end

Fabricator(:poll_with_responses, :from => :poll) do
  responses(:count => 2){|poll, index| Fabricate(:response, :poll_id => poll)}
end


