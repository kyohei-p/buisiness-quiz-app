class Api::V1::SessionsController < ApplicationController
  skip_before_action :login_required, only: [ :new, :create ]
  require "omniauth-auth0"
  require "uri"
  require "cgi"
  require "net/http"
  require "openssl"

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # auth0_login #TODO: フロント実装時に対応
      log_in(user)
      render json: { status: "SUCCESS", message: "ログインに成功しました", data: user }, status: 200
    else
      errors = [ "メールアドレスかパスワードが間違っています" ]
      render json: { status: "ERROR", message: "ログインに失敗しました", errors: errors }, status: 401
    end
  end

  def new
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      render json: { status: "SUCCESS", message: "ログアウトしました" }, status: 200
    else
      render json: { status: "ERROR", message: "ログアウト失敗しました" }, status: 401
    end
  end

  private

  # TODO: フロント実装時に対応
  # def auth0_login
  #   domain = ENV['AUTH0_DOMAIN']
  #   client_id = ENV['AUTH0_CLIENT_ID']
  #   client_secret = ENV['AUTH0_CLIENT_SECRET']
  #   audience = "https://#{domain}/api/v2/"
  #   url = URI("https://#{domain}/oauth/token")

  #   headers = {
  #     'Content-Type' => 'application/json'
  #   }

  #   data = {
  #     "audience": audience,
  #     "grant_type": "password",
  #     "username": params[:email],
  #     "password": params[:password],
  #     "client_id": client_id,
  #     "connection": "Username-Password-Authentication"
  #   }

  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true
  #   request = Net::HTTP::Post.new(url)
  #   request["content-type"] = 'application/json'
  #   request.body = "{\"client_id\":\"#{ENV['AUTH0_CLIENT_ID']}\",\"client_secret\":\"#{ENV['AUTH0_CLIENT_SECRET']}\",\"audience\":\"http://localhost:3000\",\"grant_type\":\"client_credentials\"}"
  #   request["authorization"] = ENV['AUTH0_ACCESS_TOKEN']
  #   response = http.request(request)
  #   puts response.read_body
  # end
end
