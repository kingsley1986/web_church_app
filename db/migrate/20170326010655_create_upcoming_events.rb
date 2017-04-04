class CreateUpcomingEvents < ActiveRecord::Migration
  def change
    create_table :upcoming_events do |t|
      t.string :title
      t.string :body
      t.datetime :starting_from
      t.datetime :ending_time

      t.timestamps null: false
    end
  end
end
