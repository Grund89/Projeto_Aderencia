class Machine < ApplicationRecord
  has_many :production_orders

  validates :number, presence: true, uniqueness: true
  validates :operator, presence: true

  def delayed?
    production_orders.where("scheduled_end < ?", Time.current).exists?
  end

  def current_delay_hours
    if delayed?
      ((Time.current - production_orders.last.scheduled_end) / 1.hour).round
    else
      0
    end
  end
end
