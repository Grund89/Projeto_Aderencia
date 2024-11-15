class DashboardController < ApplicationController
  def index
    @machines = Machine.includes(:production_orders).all
    @delayed_orders = ProductionOrder.delayed.includes(:machine)
    @adherence = calculate_adherence
  end

  private

  def calculate_adherence
    total = ProductionOrder.count
    return 0 if total.zero?

    on_time = ProductionOrder.on_time.count
    ((on_time.to_f / total) * 100).round
  end
end
