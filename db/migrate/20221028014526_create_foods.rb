class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.string :food_name
      t.integer :category_id
      t.integer :syoumi_syouhi
      t.date :expiration_date
      t.date :purchase_date
      t.integer :quantity

      t.timestamps
    end
  end
end
