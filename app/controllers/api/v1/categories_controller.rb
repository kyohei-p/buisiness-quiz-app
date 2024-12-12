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

    reselect_category = UserCategory.with_discarded.find_by(user_category_params)

    # カテゴリーを再選択する
    if reselect_category.discarded?
      reselect_category.undiscard!
      render json: { status: 'SUCCESS', message: "再度選択したカテゴリーを保存しました", data: reselect_category }, status: 200
    else
      # 最初のカテゴリー選択
      if user_category.save
        render json: { status: 'SUCCESS', message: "選択したカテゴリーを保存しました", data: user_category }, status: 200
      else
        render json: { status: 'ERROR', message: "選択したカテゴリーの保存に失敗しました" }, status: 422
      end
    end
  end

  def reset_category
    user_category = UserCategory.find_by(user_category_params)

    if user_category.present?
      user_category.discard
      render json: { status: 'SUCCESS', message: "カテゴリーの選択を解除しました" }, status: 204
    else
      render json: { status: 'ERROR', message: "カテゴリーの選択解除に失敗しました" }, status: 422
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def user_category_params
    params.permit(:user_id, :category_id)
  end
end
