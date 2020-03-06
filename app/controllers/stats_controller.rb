class StatsController < ApplicationController

  def stats
    render json: {
      data: [
        { title: "Top 5 most frequent items", type: "list", data: Item.top_frequent_items },
        { title: "Top 5 highest spend items", type: "list", data: Item.top_spend_items },
        { title: "Average spent per trip", type: "stat", data: Item.avg_spend_per_trip },
        { title: "Average time between trips", type: "stat", data: Item.avg_time_between_trips },
        { title: "Last trip total", type: "stat", data: Item.last_trip_total },
        { title: "Average monthly spend", type: "stat", data: Item.average_monthly_spend },
        # TODO:
        # { title: "month_spend_actual_to_budget", type: "stat", data: Item.month_spend_actual_to_budget }
      ]
    }
  end

end
