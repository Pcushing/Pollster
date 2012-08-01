require 'spec_helper'

describe Answer do
  
  # I don't think you should do it this way, just trying things out to see why not
  it "requires a response_id, question_id, and text" do
    expect { Answer.create }.should raise_error
    expect { Answer.create(:response_id => 1) }.should raise_error
    expect { Answer.create(:response_id => 1, :question_id => 1) }.should raise_error
    Answer.create(:response_id => 1, :question_id => 1, :text => "look at me").should be_valid
  end

end