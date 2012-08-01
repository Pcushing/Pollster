class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
  
  def show
    @poll = Poll.find(params[:id]) 
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
    if @poll.save
      flash[:message] = "Look at you just creating polls like a boss."
      redirect_to poll_path(@poll.id)
    else
      flash[:error] = "Well that sucks. Something went wrong."
      render root_path
    end
  end
end
