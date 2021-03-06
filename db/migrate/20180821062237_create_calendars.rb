class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :calendar_name
      t.integer :start_date, default: 1
      t.integer :end_date, default: 7
      t.integer :display_week_term, default: 3
      t.integer :start_time, default: 9
      t.integer :end_time, default: 18
      t.boolean :is_released, default: false
      t.integer :display_time, default: 5
      
      t.belongs_to :user

      t.timestamps
    end
  end
end
