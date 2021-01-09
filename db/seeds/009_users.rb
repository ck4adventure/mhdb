




unless User.find_by(email: "admin")
  me = User.new(username: "Huntress", email: "admin", password: "password", rank_id: Rank.last.id)
  me.save!
end

unless User.find_by(email: "guest")
  you = User.new(username: "Guest", email: "guest", password: "guestpass", rank_id: Rank.first.id)
  you.save!
end



