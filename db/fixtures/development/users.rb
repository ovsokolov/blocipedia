require 'random_data'

10.times do |count|
  user = User.new(
      :email                 => "admin#{count}@xxxxx.xxx",
      :name                  => RandomData.random_name,
      :premium_plan          => 0,
      :password              => "123456",
      :password_confirmation => "123456"
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

puts "#{User.count} users created"
