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
  require 'csv'

  def self.import_from_csv(file)
    # CSV.foreach(file.path, headers: true) do |row|
    CSV.foreach(file, headers: true) do |row|
      Item.create!({
        date: row[0],
        description: row[1],
        price: row[2]
      })
    end
  end



end
