# == Schema Information
#
# Table name: trips
#
#  id         :bigint           not null, primary key
#  date       :date
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ApplicationRecord
  has_many :items

end
