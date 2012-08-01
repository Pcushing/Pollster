Fabricator(:question) do
  text { Faker::Lorem.sentence(5) }
  poll_id 1
end


