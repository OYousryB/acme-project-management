class Employee < ApplicationRecord
  # Enums #
  enum department: %i[sales engineering marketing]
  enum role: %i[employee manager]

  # Association #
  has_many :projects, foreign_key: :owner_id
  has_many :participants
  has_many :participant_projects, through: :participants, source: :project

  # Validation #
  validates :first_name, :last_name, :email, :department, :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :department, inclusion: { in: departments.keys, message: 'Department is an invalid' }
  validates :role, inclusion: { in: roles.keys, message: 'Role is an invalid' }

  def role=(value)
    self[:role] = value
  rescue ArgumentError
    self[:role] = nil
  end

  def department=(value)
    self[:department] = value
  rescue ArgumentError
    self[:department] = nil
  end

  # Methods #
  def name
    "#{first_name} #{last_name}"
  end
end
