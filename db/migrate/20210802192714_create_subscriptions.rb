class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :frequency
      t.decimal :price

      t.timestamps
    end
  end
end
