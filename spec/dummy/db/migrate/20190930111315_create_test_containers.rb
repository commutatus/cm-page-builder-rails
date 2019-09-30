class CreateTestContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :test_containers do |t|
      t.string :name

      t.timestamps
    end
  end
end
