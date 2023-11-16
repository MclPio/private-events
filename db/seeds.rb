# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

bob = User.new
bob.email = 'bob@world.co'
bob.username = 'bob'
bob.password = '123456'
bob.password_confirmation = '123456'
bob.save!

event = User.find_by(username: 'bob').events.build(date_start: '2024-11-11 16', date_end: '2024-11-11 19', location: 'Leafs Coffee', description: 'bla bla bla bla bla words words words.', title: 'Art Meet')
event.save!

joe = User.new
joe.email = 'joe@world.co'
joe.username = 'joe'
joe.password = '123456'
joe.password_confirmation = '123456'
joe.save!

event = User.find_by(username: 'joe').events.build(date_start: '2024-11-11 16', date_end: '2024-11-11 19', location: 'Leafs Coffee', description: 'bla bla bla bla bla words words words.', title: 'Tech Meet')
event.save!
