# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
8.times do {
  name:
  headline:
  description:
  city:
  state:
  country:
}
t.string "name"
    t.string "headline"
    t.text "description"
    t.string "city"
    t.string "state"
    t.string "country"
