require 'spec_helper'

describe Question do
  subject { Fabricate(:question) }
  
  it { should belong_to(:poll) }
  it { should have_many(:answers) }
  it { should validate_presence_of(:poll_id) }
  it { should validate_presence_of(:text) }
end
