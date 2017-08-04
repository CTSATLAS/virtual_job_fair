class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :specialty, null: false
      t.datetime :visible_start, null: false
      t.datetime :visible_end, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.boolean :allow_late_registration, null: false, default: false

      t.timestamps
    end

    add_index :events, :visible_start
    add_index :events, :visible_end
    add_index :events, :starts_at
    add_index :events, :ends_at
  end
end
