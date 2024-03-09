# db/seeds.rb
require 'faker'
require 'open-uri'

User.destroy_all
Listing.destroy_all
Booking.destroy_all

# Create Users with Faker-generated Avatars
host_user = User.create!(
  email: 'host@example.com',
  password: 'password',
  # Add any other user attributes as needed
)
host_user.photo.attach(io: URI.open(Faker::Avatar.image(slug: host_user.email, size: '300x300', format: 'png')), filename: 'avatar.png')

guest_user = User.create!(
  email: 'guest@example.com',
  password: 'password',
  # Add any other user attributes as needed
)
guest_user.photo.attach(io: URI.open(Faker::Avatar.image(slug: guest_user.email, size: '300x300', format: 'png')), filename: 'avatar.png')

puts 'Seed data created successfully!'
