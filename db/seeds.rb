# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test1 = User.create(username: "tobuskin", password_digest: "a1b2c3d4e5", email: "h.tobusk@ymail.com", name: "Holland Tobuskin")
test2 = User.create(username: "runples", password_digest: "a1b2c3d4e56766", email: "ishlan@youginsaavfamily.com", name: "Ishlan Youginsaav")
test3 = User.create(username: "varicelli", password_digest: "22222", email: "greenpreen67@yahoo.com", name: "Evan Preen Varicelli")


10.times do 
Introvert.create(name: Faker::TvShows::BojackHorseman.character, activity: Faker::Sports::Basketball.position, on_cooldown: false)
end

Introvert.all.each do |int| 
    Friendship.create(user_id: User.all.sample.id, introvert_id: int.id)
end
