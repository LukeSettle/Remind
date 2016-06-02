class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :email
      t.string :phone_number
      t.text :message
      t.string :frequency
      t.datetime :time_of_reminder
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
