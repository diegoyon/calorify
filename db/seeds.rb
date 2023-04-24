# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  5.times do |i|
    user = User.create!(email: "user#{i+1}@gmail.com", password: "user#{i+1}@gmail.com")

    (4.months.ago.to_date..Date.current).each do |date|
      2.times do #burned activities
        Activity.create!(date: date, calories: Faker::Number.within(range: 50..500), burned: true, description: Faker::Hobby.activity, user: user)
      end
      3.times do #consumed activities
        Activity.create!(date: date, calories: Faker::Number.within(range: 100..800), burned: false, description: Faker::Food.dish, user: user)
      end
    end
  end
end