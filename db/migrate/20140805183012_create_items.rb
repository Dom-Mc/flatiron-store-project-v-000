class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.integer :price
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
