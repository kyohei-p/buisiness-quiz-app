class ApplicationController < ActionController::API
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    unless logged_in?
      render json: { message: "ログインしてください" }, status: 401
    end
  end
end
