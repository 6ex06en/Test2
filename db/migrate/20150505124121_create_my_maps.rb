class CreateMyMaps < ActiveRecord::Migration
  def change
    create_table :my_maps do |t|
      t.string :title

      t.timestamps
    end
  end
end
