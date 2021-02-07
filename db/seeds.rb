Task.destroy_all
Meeting.destroy_all
Contact.destroy_all
User.destroy_all


test_user = User.create!(email: "test@gmail.com",
                         password: "123456",
                         first_name: "Jas",
                         last_name: "H"
                         )

puts "Creating Users…"

puts "Creating Contact..."
5.times do
  contact = Contact.create!(
    first_name:Faker::Lorem.word,
    last_name:Faker::Lorem.word,
    company:Faker::Company.name,
    position:Faker::Company.profession,
    email:Faker::Internet.email,
    phone:Faker::Number.number(digits: 10),
    linkedIn:Faker::Internet.email(domain: 'linkedIn'),
    short_note:Faker::Lorem.paragraph(sentence_count: 2),
    other_url:Faker::Internet.email(domain: 'other'),
    user:test_user)
end
puts "Creating Meeting..."
rand(1..3).times do
  meeting = Meeting.create!(
    title:Faker::Lorem.word,
    meeting_time: Faker::Date.forward(days: rand(1..3)),
    note: Faker::Lorem.paragraph(sentence_count: 2),
    contact: Contact.all.sample)
end

puts "Creating Task..."

rand(2..5).times do
  task_var = Task.create!(
    time:Faker::Date.forward(days: rand(1..3)),
    note:Faker::Lorem.paragraph(sentence_count: 2),
    contact: Contact.all.sample)
end
