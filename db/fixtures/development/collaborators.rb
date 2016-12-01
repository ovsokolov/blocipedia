require 'random_data'

users = User.all
owner = User.find(11)
wiki = Wiki.private_wiki(owner).first

5.times do |count|
  Collaborator.create!(
    user_id:  users.sample.id,
    wiki_id:  wiki.id
  )
end


puts "#{Collaborator.count} posts created"
