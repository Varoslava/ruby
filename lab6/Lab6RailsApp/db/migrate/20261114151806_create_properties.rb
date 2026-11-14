class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end
