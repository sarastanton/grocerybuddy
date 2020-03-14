class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.date :date
      t.string :description
      t.decimal :price, precision: 6, scale: 2
    end
  end
end
