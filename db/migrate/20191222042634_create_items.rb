class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.date :date
      t.string :description
      t.integer :qty
      t.float :price
    end
  end
end
