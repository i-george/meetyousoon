class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :grpname
      t.string :grploc
      t.string :grpcat
      t.text :grpdesp

      t.timestamps
    end
  end
end
