class CreateDrinkSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_subscriptions do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
