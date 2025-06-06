class CreateRoomQueues < ActiveRecord::Migration[8.0]
  def change
    create_table :room_queues do |t|
      t.integer :room_id

      t.timestamps
    end
  end
end
