class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.string :location
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
