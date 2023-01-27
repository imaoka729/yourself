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
user1_category_2 = Category.create!(user_id: user1.id, category_name: '麺類')
Food.create!(user_id: user1.id, food_name: 'メロンパン', category_id: user1_category.id, syoumi_syouhi: 1, expiration_date: '2023-01-27', purchase_date: '2023-01-26', quantity: 1)
Food.create!(user_id: user1.id, food_name: 'そば', category_id: user1_category_2.id, syoumi_syouhi: 0, expiration_date: '2023-01-27', purchase_date: '2022-02-02', quantity: 2)
Food.create!(user_id: user1.id, food_name: 'クリームパン', category_id: user1_category.id, syoumi_syouhi: 1, expiration_date: '2023-01-28', purchase_date: '2023-01-27', quantity: 1)
Food.create!(user_id: user1.id, food_name: 'パスタ', category_id: user1_category_2.id, syoumi_syouhi: 0, expiration_date: '2023-03-04', purchase_date: '2020-04-26', quantity: 2)
Food.create!(user_id: user1.id, food_name: 'うどん', category_id: user1_category_2.id, syoumi_syouhi: 0, expiration_date: '2023-06-09', purchase_date: '2022-06-13', quantity: 3)
Food.create!(user_id: user1.id, food_name: 'パスタ', category_id: user1_category_2.id, syoumi_syouhi: 0, expiration_date: '2026-01-09', purchase_date: '2023-01-18', quantity: 2)

Saving.create!(account_id: user1.id, income_pay_date: "2022-12-1", income: "1000000" )
Saving.create!(account_id: user1.id, income_pay_date: "2023-01-01", pay: "500000" )
Saving.create!(account_id: user1.id, income_pay_date: "2023-01-08", pay: "400000" )

user2 = User.create!(
  account_id: 'satoru',
  passward: 'ssss',
  user_name: 'さとる',
  admin: false

)
