class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show update destroy ]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  
  #def random
  #  @questions = 
  #  render json: @questions
  #end

  # FILTER /filter?

  def filter
    if params[:cat] and params[:col]
      @questions = Question.where("category_id = ?", params[:cat]).where("exam_id = ?", params[:col])
    elsif params[:cat]
      @questions = Question.where("category_id = ?", params[:cat])
    elsif params[:col]
      @questions = Question.where("category_id = ?", params[:col])
    end
    render json: @questions
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:description, :correct_answer, :incorrect_answer, :user_id, :exam_id, :category_id)
    end
end
