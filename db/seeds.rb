# User.destroy_all
Item.destroy_all

CURRENT_TIME = Time.now

def some_time_ago
	CURRENT_TIME - rand(200..20_000).minutes
end

5.times do
  User.create(
  	username: Faker::LordOfTheRings.character,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
end

users = User.all

15.times do
 	item = Item.create(
 		name:  Faker::Hipster.sentence,
    user_id: users.sample.id,
 	)
	item.update(created_at: some_time_ago)
end

User.create(username: 'buckrivard', email: 'buckrivard@gmail.com', password: 'helloworld')

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Item.count} wikis created."
