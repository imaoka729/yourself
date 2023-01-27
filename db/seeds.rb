# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Food.destroy_all
Category.destroy_all
Saving.destroy_all

initial_user = User.create!(
  account_id: 'noriyoshi',
  passward: 'nnnn',
  user_name: 'のりよし',
  admin: true
)



user1 = User.create!(
  account_id: 'sasaki',
  passward: 'ssss',
  user_name: 'ささき',
  admin: false

)

user1_category = Category.create!(user_id: user1.id, category_name: 'パン類')
Food.create!(user_id: user1.id, food_name: "クリームパン", category_id: user1_category.id, syoumi_syouhi: "0", expiration_date: "2023-01-15", purchase_date: "2023-01-15", quantity: "3")

Saving.create!(account_id: user1.id, income_pay_date: "2022-12-1", income: "1000000" )
Saving.create!(account_id: user1.id, income_pay_date: "2023-01-01", pay: "500000" )
Saving.create!(account_id: user1.id, income_pay_date: "2023-01-08", pay: "400000" )

user2 = User.create!(
  account_id: 'satoru',
  passward: 'ssss',
  user_name: 'さとる',
  admin: false

)
