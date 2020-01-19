class StatsController < ApplicationController

  def stats
    render json: {
      top_frequent_items: Item.top_frequent_items,
      top_spend_items: Item.top_spend_items,
      avg_spend_per_trip: Item.avg_spend_per_trip,
      avg_time_between_trips: Item.avg_time_between_trips,
      last_trip_total: Item.last_trip_total,
      average_monthly_spend: Item.average_monthly_spend,
      month_spend_actual_to_budget: Item.month_spend_actual_to_budget
    }
  end

end
