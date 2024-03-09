require 'faker'
require 'open-uri'

# Seed regular users with photo
10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
  user.photo.attach(io: URI.open(Faker::Avatar.image(slug: user.email, size: '300x300', format: 'png')), filename: 'avatar.png')
end
