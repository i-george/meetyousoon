class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :group_id
      t.text :rsvp
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :members, :group_id
  end
end
