# frozen_string_literal: true

# API Cartorio

class Api::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: :login

  def render_error(message, status: :unprocessable_entity)
    render json: { errors: message }, status: status
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    @decoded = JsonWebToken.decode(header)
    @current_user = User.find(@decoded[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    render_error(e.message, status: :unauthorized)
  rescue JWT::DecodeError => e
    render_error(e.message, status: :unauthorized)
  end
end