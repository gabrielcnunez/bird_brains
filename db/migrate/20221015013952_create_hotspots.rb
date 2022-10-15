class CreateHotspots < ActiveRecord::Migration[5.2]
  def change
    create_table :hotspots do |t|
      t.string :name
      t.string :county
      t.integer :rank
      t.boolean :accessible

      t.timestamps
    end
  end
end
