class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :account_id
      t.string :passward
      t.string :user_name
      t.boolean :admin

      t.timestamps
    end
  end
end
