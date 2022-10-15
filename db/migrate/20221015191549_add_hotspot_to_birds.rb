class AddHotspotToBirds < ActiveRecord::Migration[5.2]
  def change
    add_reference :birds, :hotspot, foreign_key: true
  end
end
