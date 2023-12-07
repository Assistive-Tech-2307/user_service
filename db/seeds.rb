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

Comment.create(title: "User 1 1", link: "comment.com", description: "11", user_comment: "one one", rating: true, category_id: 1, user_id: 1)
Comment.create(title: "User 1 2", link: "comment.com", description: "12", user_comment: "one two", rating: true, category_id: 1, user_id: 1)
Comment.create(title: "User 1 3", link: "comment.com", description: "13", user_comment: "one three", rating: true, category_id: 1, user_id: 1)
Comment.create(title: "User 1 4", link: "comment.com", description: "14", user_comment: "one four", rating: true, category_id: 1, user_id: 1)
Comment.create(title: "User 2 1", link: "comment.com", description: "21", user_comment: "two one", rating: true, category_id: 1, user_id: 2)
Comment.create(title: "User 2 2", link: "comment.com", description: "22", user_comment: "two two", rating: true, category_id: 2, user_id: 2)
Comment.create(title: "User 3 1", link: "comment.com", description: "31", user_comment: "three one", rating: true, category_id: 2, user_id: 3)
Comment.create(title: "User 3 2", link: "comment.com", description: "32", user_comment: "three two", rating: true, category_id: 2, user_id: 3)
Comment.create(title: "User 3 3", link: "comment.com", description: "33", user_comment: "three three", rating: true, category_id: 2, user_id: 3)