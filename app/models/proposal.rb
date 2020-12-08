class Proposal < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :deadline, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0

  validate :deadline_after_today

  private

  def deadline_after_today
    return if deadline.blank?

    errors.add(:deadline, " - A data de entrega deverá ser uma data futura!") if deadline <= Date.today
  end
end
