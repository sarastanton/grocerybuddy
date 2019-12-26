class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.date :date
      t.string :description
      t.float :price
    end
  end
end
