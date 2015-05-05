class AddMyMapRefToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :my_map_id, :integer, index: true
  end
end
