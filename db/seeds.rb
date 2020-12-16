# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Default User
User.create!(name: 'Madeline Murphy',
             email: 'madeline@murphy.com',
             password: '0dinProject',
             password_confirmation: '0dinProject')

12.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = "member#{n+1}@example.com"
  password = '0dinProject'
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password)
end

13.times do |n|
  content = Faker::Lorem.paragraph(sentence_count: 8, supplemental: true, random_sentences_to_add: 8)
  user_id = n+1
  Post.create!(content: content,
               user_id: user_id)
end
