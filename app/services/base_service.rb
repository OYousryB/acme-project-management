class BaseService
  def execute
    ApplicationRecord.transaction do
      _execute
    rescue StandardError => e
      rollback
      raise e
    end
  end

  private

  # To be implemented in subclasses
  def _execute
    raise NotImplementedError
  end

  # To be implemented in subclasses if needed. I
  # Rollback changes other than DB changes (like API calls that modifies something)
  def rollback; end
end
