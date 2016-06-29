class Api::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = login(session_params[:email], session_params[:password])
    unless @user
      @error_message = "メールアドレスかパスワードが間違っています。"
    end
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end
