# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")
User.create(name: "Amy Rowley", email: "amy@aol.com", password: "Rowley10!")
User.create(name: "Oliver Brown", email: "brown@aol.com", password: "Brown10!")

Category.create(title: "Blindness")
Category.create(title: "Low Vision")
Category.create(title: "Deaf/Hard of Hearing")
Category.create(title: "Mobility Supports for Fine Motor Issues")
Category.create(title: "Mobility Supports for Gross Motor Issues")
Category.create(title: "Cognitive Supports for Reading and Writing")
Category.create(title: "Cognitive Supports for Math")
Category.create(title: "Cognitive Supports for Focus")
Category.create(title: "Communication Supports")