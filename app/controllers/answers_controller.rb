class AnswersController < ApplicationController
  def create
    choice = Choice.find(params[:choice][:id])
    answer = Answer.create user: current_user, choice: choice
    if answer.valid?
      redirect_to polls_path choice.poll, hide_already_answered: true
    end
  end
end
