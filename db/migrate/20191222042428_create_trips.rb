class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :date
      t.float :total

      t.timestamps
    end
  end
end
