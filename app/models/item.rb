# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :string
#  price       :float
#  qty         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  trip_id     :bigint
#
# Indexes
#
#  index_items_on_trip_id  (trip_id)
#

class Item < ApplicationRecord
  belongs_to :trip

  require 'csv'

  def self.import_from_csv(file)
    # CSV.foreach(file.path, headers: true) do |row|
    CSV.foreach(file, headers: true) do |row|
      Item.create!({
        date: row[0],
        description: row[1],
        price: row[2],
        qty: row[3],
        trip_id: row[4]
      })
    end
  end



end
