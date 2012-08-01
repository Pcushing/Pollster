require 'spec_helper'

describe Poll do
  let(:poll) { Fabricate(:poll) }
  subject { poll }
  
  it { should have_many(:responses) }
  it { should have_many(:questions) }
  it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:edit_url) }
  it { should validate_uniqueness_of(:edit_url) }
  #Failure/Error: it { should validate_uniqueness_of(:edit_url) }
  #Expected errors to include "has already been taken" when edit_url is set to "9xDW1kYL4TKYvg", got errors: ["name can't be blank (nil)"]
  
  
end
