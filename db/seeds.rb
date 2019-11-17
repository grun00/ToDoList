# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user = User.create(email: 'a@b.c', password: '123456')
Profile.create(nickname: 'Junko', bio: 'Just your normal User', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")
Task.create(title: 'Task is Unbreakable', description: 'This task is yet another task in the task family of tasks with task in the title of the task.', priority: 20, user: user, share: true)

path_adm = Rails.root.join 'app', 'assets', 'images', 'test-update.png'
adm = User.create(email: 'adm@email.com', password: '123456')
Profile.create(nickname: 'Mukuro', bio: 'Just your administration User', user: adm, share: true).avatar.attach(io: File.open(path_adm), filename: "test-image.png")


for i in 0..2 do
  task = Task.create(title: "Example Task \##{i + 1}", description: 'A Task can have a description of up to 280 characters!', priority: (10*i), user: adm, status: 10, share: true)
  Comment.create(body: "This Example Task \##{i + 1} has one Example Comment!", task: task, user: adm)
end

