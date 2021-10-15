class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_token

  serialization_scope :view_context

  skip_before_action :verify_authenticity_token

  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from AbstractController::ActionNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from NoMethodError, with: :not_found

  def not_found
    render json: { errors: 'Not Found' }, status: 404
  end

  def route_not_found
    render json: { errors: 'Bad request' }, status: 400
  end

  def authenticate_token
    token = request.headers['token']
    render json: { errors: 'Invalid Token' }, status: 403 if AuthToken.active.find_by(token: token).nil?
  end
end
