class StatsController < ApplicationController

  def top_frequent_items
    query = <<~SQL
      SELECT description, COUNT (description) as frequency
      FROM public.items
      GROUP BY description
      ORDER BY frequency DESC
      LIMIT 5
    SQL
    render json: ActiveRecord::Base.connection.execute(query)
  end

  def top_spend_items
    query = <<~SQL
      SELECT description, SUM (price) as total
      FROM public.items
      GROUP BY description
      ORDER BY total DESC
      LIMIT 5
    SQL
    render json: ActiveRecord::Base.connection.execute(query)
  end

  def avg_spend_per_trip
    total_spend = Item.sum(:price)
    trip_count = Item.pluck(:date).uniq.count
    avg_spend = total_spend / trip_count
    render json: avg_spend.round(2)
  end

  def avg_time_between_trips
    dates = Item.pluck(:date).uniq
    date_span = (dates.max - dates.min).to_i
    avg_between_dates = date_span / (dates.length - 1)
    render json: (date_span / (dates.length - 1).to_f).round(0)
  end

  def avg_time_between_purchases
    items = Item.where(description: params[:description]).all
    item_dates = items.pluck(:date).uniq
    date_span = (item_dates.max - item_dates.min).to_i
    item_count = items.count
    render json: (date_span / (item_count - 1).to_f).round(0)
  end

  def last_trip_total
    query = <<~SQL
      SELECT date, SUM (price) as total
      FROM public.items
      GROUP BY date
      ORDER BY date DESC
      LIMIT 1
    SQL
    render json: ActiveRecord::Base.connection.execute(query)
  end

  def average_monthly_spend
    query = <<~SQL
      SELECT date_trunc('month', date) AS mon
      FROM items
      GROUP BY mon
      ORDER BY mon DESC
    SQL
    month_count = ActiveRecord::Base.connection.execute(query).count
    total_spend_sum = Item.sum(:price)
    render json: (total_spend_sum / month_count).to_f.round(2)
  end

  def month_spend_actual_to_budget
    actual = Item.where(
      "EXTRACT('month' FROM date) = ?
      AND EXTRACT('year' FROM date) = ?",
      Date.current.month, Date.current.year)
      .sum(:price)
    budget = 350
    render json: { actual: actual, percentage: ((actual / budget) * 100).round(1) }
  end

end
