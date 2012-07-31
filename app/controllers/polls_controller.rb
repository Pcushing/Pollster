class PollsController < ApplicationController
  
  def show
    # if params[:id].is_a?String
      # @poll = Poll.find_by_edit_url(params[:id]) 
    # else
      @poll = Poll.find(params[:id]) 
    # end
  end
  
  def edit
    @poll = Poll.find_by_edit_url(params[:edit_url])
  end
  
  def update
    poll = Poll.find(params[:id])
    poll.update_attributes(params[:poll])
    flash[:message] = "Updating...nbd"
    redirect_to edit_poll(poll.edit_url)
  end
  
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.edit_url  = SecureRandom.base64(10).gsub(/\W/,'')

    if @poll.save
      flash[:message] = "Look at you just creating polls like a boss.  You might want this http://#{request.host}:#{request.port.to_s}/polls/e/#{@poll.edit_url} for editing and this http://#{request.host}:#{request.port.to_s}#{poll_path(@poll.id)}."
      redirect_to edit_obscured_path(@poll.edit_url)
    else
      flash[:error] = "Well that sucks. Something went wrong."
      render root_path
    end
  end
end
