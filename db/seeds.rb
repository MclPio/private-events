# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def user_gen
  for i in 1..30 do
    user_name = "user#{i}"
    User.create(username: user_name, 
                email: "#{user_name}@world.co",
                password: "123456",
                password_confirmation: "123456")
  end
end

def event_gen()
  for i in 1..10 do
    event_name = "event #{i}"
    date_start = "2024-01-#{i} 16"
    date_end = "2024-01-#{i} 20"
    user_dynamic = User.find(User.first.id + i)
    Event.create(date_start: date_start,
                 date_end: date_end,
                 location: 'Leafs Coffee',
                 description: 'bla bla bla bla bla words words words.',
                 title: event_name).creator = user_dynamic
  end
end

user_gen()
event_gen()