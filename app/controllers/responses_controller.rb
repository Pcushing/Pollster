class ResponsesController < ApplicationController
  
  def new
    @poll = Poll.find_by_name(params[:name])
    @response = @poll.responses.new
  end
  
  def create
    @poll = Poll.find(params[:response][:poll_id])
    if session[:polls_taken] != @poll.id
      @response = @poll.responses.create
      create_answers
      flash[:message] = "You just created a response, you lucky duck.  Thanks for taking the survey."
      redirect_to new_response_path(@poll.name)
      session[:polls_taken] = @poll.id
    else
      flash[:notice] = "Sorry, you've already submitted this one, brah."
      redirect_to root_path
    end
  end
  
  private
    
    def create_answers
      #This feels strange and potentially slow.  There's got to be a better way.
      params.each { |k,v| @response.answers.create(:text => v, :question_id => k.to_i) if k =~ /^\d/ }
    end
end


