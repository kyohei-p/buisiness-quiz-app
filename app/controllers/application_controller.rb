class ApplicationController < ActionController::API
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    unless logged_in?
    end
  end
end
