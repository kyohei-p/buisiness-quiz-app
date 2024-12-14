class Api::V1::CategoriesController < ApplicationController
  before_action :login_required, only: [:index, :selected_category, :reset_category]
  before_action :set_category, only: [:selected_category]

  def index
    categories = Category.all.order(created_at: "ASC")
    render json: { status: "SUCCESS", message: "カテゴリーの一覧表示", categories: categories }, status: 200
  end

  def selected_category
    set_category

    user_category = UserCategory.new(user_category_params)
    reselected_category = UserCategory.with_discarded.find_by(user_category_params)

    if reselected_category.present?
      reselected_category.undiscard!
      category = reselected_category
    else
      category = user_category
    end

    if category.save!
      render json: { status: 'SUCCESS', message: "選択したカテゴリーを保存しました", data: category }, status: 200
    else
      render json: { status: 'ERROR', message: "選択したカテゴリーの保存に失敗しました" }, status: 422
    end
  rescue StandardError => e
    puts e.class
    puts e.message
    render json: { status: 'ERROR', message: "例外エラーが発生しました", error: [e.class, e.message] }, status: 500
  end

  def reset_category
    user_category = UserCategory.find_by(user_category_params)

    if user_category.present?
      user_category.discard
      render json: { status: 'SUCCESS', message: "カテゴリーの選択を解除しました", data: user_category }, status: 200
    else
      render json: { status: 'ERROR', message: "カテゴリーの選択解除に失敗しました" }, status: 422
    end
  end

  private

  def set_category
    category = Category.find(params[:category_id])
  end

  def user_category_params
    params.permit(:user_id, :category_id)
  end
end
