require 'random_data'

users = User.all

50.times do |count|
  Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    private: 0
  )
end

10.times do |count|
  Wiki.create!(
    user:   User.find(1),
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    private: 0
  )
end

puts "#{Wiki.count} posts created"
