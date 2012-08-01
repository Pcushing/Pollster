require 'spec_helper'

describe Response do
  # Doing this a bit more manual as practice without shoulda
  it "fails to create a response without a poll_id" do
    expect { Response.create }.should raise_error
  end
  
  it "creates a response from a poll" do
    poll = Fabricate(:poll)
    poll.responses.create.should be_valid
  end
  
  it "can have answers" do
    response = Fabricate(:poll).responses.create
    response.answers.new.should be_valid
  end

end