class AuthToken < ApplicationRecord
  include UtilityConcern

  # Scope #
  scope :active, -> { where(expired: false) }

  # Validation #
  validates :token, presence: true, uniqueness: { case_sensitive: false }

  # Actions #
  before_validation :create_token

  # Methods #
  def create_token
    self.token ||= generate_token
    self.expired = false
  end

  def generate_token
    loop do
      token = "#{random_token}#{unique_ending}"
      break token unless AuthToken.exists?(token: token)
    end
  end
end
