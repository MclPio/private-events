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

def event_gen_2023()
  for i in 1..10 do
    date_start = Time.new(2023, 5, 20, 13, 0, 0)
    date_end = Time.new(2023, 5, 20, 14, 0, 0)

    User.all[i].events.create(date_start: date_start,
                              date_end: date_end,
                              location: "Toronto, ON",
                              description: "This is description number #{i}",
                              title: "Title number #{i}")
  end
end

def event_gen_2024()
  for i in 1..10 do
    date_start = Time.new(2024, 5, 20, 13, 0, 0)
    date_end = Time.new(2024, 5, 20, 14, 0, 0)

    User.all[i].events.create(date_start: date_start,
                              date_end: date_end,
                              location: "Toronto, ON",
                              description: "This is description number #{i}",
                              title: "Title number #{i}")
  end
end

def attendance_gen
  i = 0
  User.all.reverse.each do |user|
    first_event = Event.first.id
    event_counter = first_event + i
    user.attendances.create(event_id: event_counter)
    i += 1
  end
end

user_gen
event_gen_2023
event_gen_2024
attendance_gen
