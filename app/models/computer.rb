class Computer < ApplicationRecord
  validates :name, presence: true

  before_save :generate_uuid

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
