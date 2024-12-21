class Api::V1::Quiz::QuestionsController < ApplicationController
  skip_before_action :login_required, only: [:show]
  before_action :set_selected_category, only: [:show]

  def show
    if @user_category
      @quiz_question = Quiz::Question.where(category_id: @user_category.category_id).order("RAND()").first
      @quiz_options = Quiz::Answer.where(quiz_question_id: @quiz_question)
      render json: { status: "SUCCESS", message: "クイズデータを取得しました", quiz_question: @quiz_question, quiz_options: @quiz_options }, status: 200
    else
      render json: { status: "ERROR", message: "クイズデータを取得できませんでした" }, status: 422
    end
  rescue StandardError => e
    render json: { status: 'ERROR', message: "例外エラーが発生しました", error: [e.class, e.message] }, status: 500
  end

  private

  def set_selected_category
    @user_category = UserCategory.find_by(category_id: params[:category_id])
  end
end
