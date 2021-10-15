module UtilityConcern
  extend ActiveSupport::Concern

  included do
    def random_token
      SecureRandom.urlsafe_base64(nil, false)
    end

    def unique_ending
      (Time.now.to_f * 1000).to_i
    end
  end
end
