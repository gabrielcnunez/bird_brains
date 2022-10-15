class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.string :behavior
      t.integer :quantity
      t.boolean :raptor

      t.timestamps
    end
  end
end
