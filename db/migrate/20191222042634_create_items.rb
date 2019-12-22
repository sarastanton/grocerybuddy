class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :trip
      t.date :date
      t.string :description
      t.integer :qty
      t.float :price

      t.timestamps
    end
  end
end
