# Ranks are pretty Static
titles = [
  "Novice",
  "Recruit",
  "Apprentice",
  "Initiate",
  "Journeyman",
  "Master",
  "Grandmaster",
  "Legendary",
  "Hero",
  "Knight",
  "Lord",
  "Baron",
  "Count",
  "Duke",
  "Grand Duke",
  "Archduke",
  "Viceroy",
  "Elder",
  "Sage",
  "Fabled",
]

titles.each do |titl|
  t = Rank.find_or_create_by!(title: titl)
  path = titl.delete("'").split(" ").join('_').downcase + '.gif'
  t.image.attach(
    io: File.open("./public/seeds_images/ranks/#{path}"),
    filename: path,
    content_type: 'application/gif',
  )
end