# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    name: Faker::Name.name_with_middle,
    admin: Faker::Boolean.boolean,
  )
  user.save!
end

20.times do
  post = Post.new(
    user_id: User.all.sample.id,
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    image: "https://picsum.photos/200/300",
  )
  post.save
end

100.times do
  comment = Comment.new(
    user_id: User.all.sample.id,
    content: Faker::Lorem.paragraph,
    post_id: rand(1..20),
  )
  comment.save
end
