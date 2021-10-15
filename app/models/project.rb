class Project < ApplicationRecord
  # Enums #
  enum state: %i[pending planned active done failed], _default: 'pending'

  # Association #
  belongs_to :owner, class_name: 'Employee', foreign_key: :owner_id
  has_many :participants
  has_many :participant_employees, through: :participants, source: :employee

  # Validation #
  validates :name, :owner, presence: true
  validate :owner_is_manager?

  validates :state, inclusion: { in: states.keys, message: 'State is an invalid' }

  def state=(value)
    self[:state] = value
  rescue ArgumentError
    self[:state] = nil
  end

  def owner_is_manager?
    errors.add(:owner, 'Project Owner Must Be A Manager') unless owner&.role == 'manager'
  end

  class << self
    def active_projects
      "#{(Project.active.count / Project.count.to_f) * 100}%"
    end
  end
end
