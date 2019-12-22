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

require 'rails_helper'

RSpec.describe Trip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
