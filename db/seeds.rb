# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

for i in 1..4 do #amount of users
  user = User.create!(email: "user#{i}@gmail.com", password: "user#{i}@gmail.com")

  (4.months.ago.to_date..Date.current).each do |date|
    4.times do #activites per day
      bool = Faker::Boolean.boolean
      if bool
        Activity.create!(date: date, calories: Faker::Number.within(range: 50..500), burned: true, description: Faker::Hobby.activity, user_id: user.id)
      else
        Activity.create!(date: date, calories: Faker::Number.within(range: 100..1000), burned: false, description: Faker::Food.dish, user_id: user.id)
      end
    end
  end
end