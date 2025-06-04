class CreateMasters < ActiveRecord::Migration[8.0]
  def change
    create_table :masters do |t|
      t.integer :max_customer_per_agent

      t.timestamps
    end
  end
end
