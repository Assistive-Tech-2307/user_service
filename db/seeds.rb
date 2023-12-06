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

Comment.create(title: "Comment1", link: "comment.com", description: "This is a comment", user_comment: "This is a comment", rating: true, user_recommended: true, category_id: 1)
Comment.create(title: "Comment2", link: "comment.com", description: "This is 2 comments", user_comment: "This is a comment 2", rating: true, user_recommended: true, category_id: 1)
Comment.create(title: "Comment3", link: "comment.com", description: "This is 3 comments", user_comment: "This is a comment 3", rating: true, user_recommended: true, category_id: 1)
Comment.create(title: "Comment4", link: "comment.com", description: "This is 4 comments", user_comment: "This is a comment 4", rating: true, user_recommended: true, category_id: 1)
Comment.create(title: "Comment5", link: "comment.com", description: "This is 5 comments", user_comment: "This is a comment 5", rating: true, user_recommended: true, category_id: 1)
Comment.create(title: "Comment6", link: "comment.com", description: "This is 6 comments", user_comment: "This is a comment 6", rating: true, user_recommended: true, category_id: 1)