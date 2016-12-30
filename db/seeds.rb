# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(username: "Corey", email: "corey@videotube.com", password: "password", settings: {})
u2 = User.create(username: "TimeBomb", email: "timebomb@videotube.com", password: "password", settings: {})

v = Video.create(title: "Video title", video_loc: "test", description: "This is a video description", thumbnail: "test", views: 100, likes: 17, dislikes: 3, user_id: u.id)

s = Subscription.create(user_id: u.id, sub_id: u2.id)
