# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :string
#  price       :float
#

class Item < ApplicationRecord
  extend ActionView::Helpers::TextHelper
  require 'csv'

  def self.import_from_csv(file)
    CSV.foreach(file, headers: true) do |row|
      Item.create!({
        date: row[0],
        description: row[1],
        price: row[2]
      })
    end
  end

  def self.top_frequent_items
    query = <<~SQL
      SELECT description, COUNT (description) as frequency
      FROM items
      GROUP BY description
      ORDER BY frequency DESC
      LIMIT 5
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def self.top_spend_items
    query = <<~SQL
      SELECT description, SUM (price) as total
      FROM items
      GROUP BY description
      ORDER BY total DESC
      LIMIT 5
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def self.avg_spend_per_trip
    total_spend = Item.sum(:price)
    trip_count = Item.pluck(:date).uniq.count
    "$#{(total_spend / trip_count).to_f.round(2)}"
  end

  def self.avg_time_between_trips
    dates = Item.pluck(:date).uniq
    date_span = (dates.max - dates.min).to_i
    avg_between_dates = date_span / (dates.length - 1)
    "#{pluralize((date_span / (dates.length - 1).to_f).round(0), 'day')}"
  end

  # TODO: 
  # def self.avg_time_between_purchases(item_desc)
  #   items = Item.where(description: item_desc).all
  #   item_dates = items.pluck(:date).uniq
  #   date_span = (item_dates.max - item_dates.min).to_i
  #   item_count = items.count
  #   (date_span / (item_count - 1).to_f).round(0)
  # end

  def self.last_trip_total
    query = <<~SQL
      SELECT date, CONCAT('$', SUM (price)) as total
      FROM items
      GROUP BY date
      ORDER BY date DESC
      LIMIT 1
    SQL
    result = ActiveRecord::Base.connection.execute(query)
    result.values[0][1]
  end

  def self.average_monthly_spend
    query = <<~SQL
      SELECT date_trunc('month', date) AS mon
      FROM items
      GROUP BY mon
      ORDER BY mon DESC
    SQL
    month_count = ActiveRecord::Base.connection.execute(query).count
    total_spend_sum = Item.sum(:price)
    "$#{(total_spend_sum / month_count).to_f.round(2)}"
  end

  # TODO:
  # def self.month_spend_actual_to_budget
  #   actual = Item.where(
  #     "EXTRACT('month' FROM date) = ?
  #     AND EXTRACT('year' FROM date) = ?",
  #     Date.current.month, Date.current.year)
  #     .sum(:price)
  #   budget = 350
  #   { actual: actual, percentage: ((actual / budget) * 100).round(1) }
  # end

end
