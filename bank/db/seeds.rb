# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


margus = User.create(
  name: "Margus Pärt",
  email: "margus@wave.ee",
  password: "password"
  )
puts margus.errors.to_json

albert = User.create(
  name: "Albert Tupskin",
  email: "albert@wave.ee",
  password: "password"
  )
puts albert.errors.to_json

margus_account = Account.create(
  user: margus,
  balance_cents: 10000
  )
puts margus_account.errors.to_json

albert_account = Account.create(
  user: albert,
  balance_cents: 10000
  )
puts albert_account.errors.to_json

transfer = Transfer.create(
  from_account: margus_account,
  to_account: albert_account,
  amount_cents: 1000
  )
puts transfer.errors.to_json
