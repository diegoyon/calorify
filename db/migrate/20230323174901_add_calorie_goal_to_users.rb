class AddCalorieGoalToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :calorie_goal, :integer
  end
end
