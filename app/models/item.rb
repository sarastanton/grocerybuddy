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
  
end
