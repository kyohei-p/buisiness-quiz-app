class Api::V1::CategoriesController < ApplicationController
  include SessionsHelper
  before_action :logged_in, only: [:index, :selected_category]

  def index
    categories = Category.all.order(created_at: "ASC")
    render json: { status: "SUCCESS", message: "カテゴリーの一覧表示", categories: categories }, status: 200
  end

  def selected_category
    category = Category.find(params[:category_id])

    user_category = UserCategory.new(user_category_params)

    if current_user && category.present?
      user_category.save
      render json: { status: 'SUCCESS', message: "選択したカテゴリーの保存に成功しました", data: user_category }, status: 200
    else
      render json: { status: 'ERROR', message: "選択したカテゴリーの保存に失敗しました" }, status: 422
    end
  end

  private

  def user_category_params
    params.permit(:user_id, :category_id)
  end

  def logged_in
    unless logged_in?
      render json: { error: "ログインしてください" }, status: 401
    end
  end
end
