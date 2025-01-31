class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login]
  before_action :authenticate_request, only: %i[current]
 
  def login
    command = AuthenticateUser.call(params[:email_address], params[:password])
 
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def current
    render json: { email_address: current_user.email_address, name: current_user.name }
  end

end