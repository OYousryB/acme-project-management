class Api::V1::AuthTokensController < ApplicationController
  skip_before_action :authenticate_token

  def create
    auth_token = AuthTokens::CreateService.new.execute
    if auth_token.persisted?
      render json: auth_token, status: :created, serializer: AuthTokenSerializer
    else
      render json: { errors: auth_token.errors }, status: :unprocessable_entity
    end
  end
end
