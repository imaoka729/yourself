# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#initial_user = User.create!(
#  account_id: 'apple',
#  passward: 'aaaa',
#  user_name: 'りんご',
#  admin: true
#)

User.create!(
  account_id: 'banana',
  passward: 'bbbb',
  user_name: 'ばなな',
  admin: false
)
    