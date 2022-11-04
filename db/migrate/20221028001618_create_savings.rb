class CreateSavings < ActiveRecord::Migration[6.1]
  def change
    create_table :savings do |t|
      t.string :account_id
      t.date :income_pay_date
      t.integer :pay
      t.integer :income

      t.timestamps
    end
  end
end
