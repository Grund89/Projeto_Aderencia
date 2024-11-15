class ProductionOrder < ApplicationRecord
  belongs_to :machine

  validates :program_number, presence: true
  validates :scheduled_start, presence: true
  validates :scheduled_end, presence: true

  scope :delayed, -> { where("scheduled_end < ?", Time.current) }
  scope :on_time, -> { where("scheduled_end >= ?", Time.current) }
end
