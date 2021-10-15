module AuthTokens
  class CreateService < BaseService
    def _execute
      AuthToken.create
    end
  end
end
