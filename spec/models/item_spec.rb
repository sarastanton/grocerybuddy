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

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
