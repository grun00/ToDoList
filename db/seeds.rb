# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
path_adm = Rails.root.join 'app', 'assets', 'images', 'test-update.png'
user = User.create(email: 'a@b.c', password: '123456')
Profile.create(nickname: 'KillerQueen', bio: 'Just your normal User', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")


adm = User.create(email: 'adm@email.com', password: '123456')
Profile.create(nickname: 'RadioGaga', bio: 'Just your administration User', user: adm).avatar.attach(io: File.open(path_adm), filename: "test-image.png")


for i in 0..2 do
  task = Task.create(title: "Example Task \##{i + 1}", description: 'A Task can have a description of up to 280 characters!', priority: (10*i), user: adm, status: 10, share: true)
end
