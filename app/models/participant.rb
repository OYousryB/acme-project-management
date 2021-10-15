class Participant < ApplicationRecord
  # Association #
  belongs_to :employee
  belongs_to :project

  # Validation #
  validates :employee, :project, presence: true
  validate :same_department?
  validates_uniqueness_of :employee, scope: :project, message: 'Participant has already added to this project'

  # Methods #
  private

  def same_department?
    if project&.owner&.department != employee&.department
      errors.add(:participant, 'Participants must be part of the same department as the owner')
    end
  end
end
