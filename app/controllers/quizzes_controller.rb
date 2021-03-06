class QuizzesController < ApplicationController
  load_and_authorize_resource

  def index
    @quizzes = Quiz.visible(current_user).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
    @passed_quizes = current_user.attempts.pluck(:quiz_id)
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz)
    else
      render :edit
    end
  end

  def create
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(
        :title
    ).merge(
        status: params[:quiz][:status].try(:to_i) || 0
    )
  end

end
