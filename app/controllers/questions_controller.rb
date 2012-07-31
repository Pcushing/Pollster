class QuestionsController < ApplicationController
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    flash[:message] = "Question updated!"
    redirect_to edit_obscured_path(@question.poll.edit_url)
  end
  
  def destroy
    @question = Question.find(params[:id])
    original_poll = @question.poll
    @question.destroy
    redirect_to edit_obscured_path(original_poll.edit_url)
  end
  
  def create
    @question = Question.new(params[:question])
    @question.save
    flash[:message] = "New question added, chief."
    redirect_to edit_obscured_path(@question.poll.edit_url)
  end
  
end
