# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :string
#  price       :decimal(6, 2)
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
