class AddCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activity_counter, :integer
  end
end
