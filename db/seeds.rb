# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Workout.create(user_id: 1, content: "Cardio for 20 minutes!", calories_burned: 200, duration: 60)

meal = Meal.create(user_id: 1, meal_type: "Breakfast")

FoodItem.create(meal_id: 1,
  name: "Chickfila Chicken Minis 4 count",
  serving_size: 1,
  num_servings: 1,
  calories: 370,

  )
