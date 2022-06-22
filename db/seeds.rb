# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

question_category = ["fiqh","aqeeda"]


if User.count==0
    User.create(username:"tim",email:"s90six@gmail.com",password: "pword1",password_confirmation:"pword1",admin: true)
    # User.create(username:"tim2",email:"s91six@gmail.com",password: "pword2",password_confirmation:"pword2")
    # User.create(username:"tim3",email:"s92six@gmail.com",password: "pword3",password_confirmation:"pword3")
    # User.create(username:"tim4",email:"s93six@gmail.com",password: "pword4",password_confirmation:"pword4")
end


if Category.all.length == 0
    question_category.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
end



if Question.all.length == 0
    Question.create(user_id:1,category_id:1,title:"No Title 1",body:"No Body 1")
    # Question.create(user_id:2,category_id:1,title:"No Title 2",body:"No Body 2")

end

end    