# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)








unless User.find_by(email: "admin")
  me = User.new(username: "Huntress", email: "admin", password: "password", rank_id: Rank.last.id)
  me.save!
end

unless User.find_by(email: "guest")
  you = User.new(username: "Guest", email: "guest", password: "guestpass", rank_id: Rank.first.id)
  you.save!
end