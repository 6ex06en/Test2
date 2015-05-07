class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, index: true
      t.string :email, index: true
      t.string :phone
      t.timestamps
    end
  end
end
