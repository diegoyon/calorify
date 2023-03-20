class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer :calories
      t.boolean :burned?
      t.string :description

      t.timestamps
    end
  end
end
