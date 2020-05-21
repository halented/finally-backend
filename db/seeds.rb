# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.destroy_all
Introvert.all.destroy_all
Purpose.all.destroy_all
Hangout.all.destroy_all
Friendship.all.destroy_all

img_array = ["bear", "bull", "bun", "dog", "flam", "koala", "fallback"]

test1 = User.create(username: "tobuskin", password: "a1b2c3d4e5", email: "h.tobusk@ymail.com", name: "Holland Tobuskin")
test2 = User.create(username: "runples", password: "a1b2c3d4e56766", email: "ishlan@youginsaavfamily.com", name: "Ishlan Youginsaav")
test3 = User.create(username: "varicelli", password: "22222", email: "greenpreen67@yahoo.com", name: "Evan Preen Varicelli")
test4 = User.create(username: "tiinymonster", password: "111", email: "tiiny@rocketmail.com", name: "Bernadette Tini")

# postData = {email: 'tiiny@rocketmail.com', username: 'tiinymonster', password: '111'}


Purpose.create(title: 'Lip Flexing', equipment: 'small towel', intensity: 2)
Purpose.create(title: 'Jogbarking', equipment: 'sneakers, lightweight megaphone', intensity: 7)
Purpose.create(title: 'Watching', equipment: 'stick of gum', intensity: 1)
Purpose.create(title: 'Showing Off', equipment: 'armband', intensity: 5)
Purpose.create(title: 'Fancy Picking', equipment: 'dumbbells, sand, large hammock, industrial rubber', intensity: 10)
Purpose.create(title: 'Squid Pulling', equipment: 'wetsuit, drybag, very small rocks', intensity: 8)
Purpose.create(title: 'Coordinated Milling', equipment: 'subtle clothing, smoke signal sheet', intensity: 3)
Purpose.create(title: 'Vibreaking', equipment: 'mouth guard, determination', intensity: 9)

10.times do 
Introvert.create(name: Faker::TvShows::Community.characters, activity: Faker::Games::Pokemon.move, on_cooldown: false, img_ref: img_array.sample)
end

Introvert.all.each do |int| 
    Friendship.create(user_id: User.all.sample.id, introvert_id: int.id)
end

Hangout.create(location: "Gas Works", duration: 60, friendship_id: Friendship.last.id, purpose_id: Purpose.all.sample.id)

# at least three friends for test4
$f1 = Friendship.create(user_id: test4.id, introvert_id: Introvert.all.sample.id)
$f2 = Friendship.create(user_id: test4.id, introvert_id: Introvert.all.sample.id)
$f3 = Friendship.create(user_id: test4.id, introvert_id: Introvert.all.sample.id)

# perhaps instead of hardcoding we grab all of test4's friendships here and put a sample in the place of the friendship id's below
# hangouts for every month in 2019
def nineteenData

    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-01-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-01-29 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-02-10 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-03-09 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-03-14 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-03-30 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-04-01 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-04-11 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-04-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-04-27 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-05-08 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-05-20 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-05-28 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-06-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-06-25 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-07-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-07-23 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-07-29 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-08-05 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-08-12 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-08-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2019-08-22 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2019-08-28 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-09-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-10-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-11-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-12-06 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2019-12-25 17:03:41")
end

nineteenData()
# hangouts for every month in 2020

def twentyData
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2020-01-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2020-02-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2020-02-25 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2020-03-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2020-03-25 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2020-04-10 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2020-04-19 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f2.id, purpose_id: Purpose.all.sample.id, created_at: "2020-04-29 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f3.id, purpose_id: Purpose.all.sample.id, created_at: "2020-05-07 17:03:41")
    Hangout.create(location: "Cascadia", duration: 60, friendship_id: $f1.id, purpose_id: Purpose.all.sample.id, created_at: "2020-05-19 17:03:41")
end

twentyData()
# no hangouts prior