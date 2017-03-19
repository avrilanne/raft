# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Teb", last_name: "Demson", username: "oldtab", email: "tag@email.com", password_digest: "password")

User.create(first_name: "Avril", last_name: "Dunleavy", username: "bangarang", email:"bang@rang.edu", password_digest: "123")

Event.create(location: "", date: "", time: "", group_id: 1, host_id: 1, name: "Dinner")

Membership.create(group_id: 1, user_id: 1, fee: "$5", paid: true)

Group.create(admin_id: 1, name: "Friend Group")

Question.create(event_id: 1, content: "Where should we eat?")

Option.create(question_id: 1, op_content: "Nando's")

Option.create(question_id: 1, op_content: "Mr Gyros")

Option.create(question_id: 1, op_content: "Portillos")

Ranking.create(option_id: 1, user_id: 1, position: 1)

Ranking.create(option_id: 2, user_id: 1, position: 3)

Ranking.create(option_id: 3, user_id: 1, position: 2)
