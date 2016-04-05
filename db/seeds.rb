# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "admin", email: 'admin@gmail.com', password: '12345678')
User.create(name: "user", email: 'user@gmail.com', password: '12345678')
Talk.create(title:"Title 1", description:"Description 1", duration:"1", speaker:"One", state:"pending", tag_list:"ruby, javascript")
Talk.create(title:"Title 2", description:"Description 2", duration:"2", speaker:"Two", state:"pending", tag_list:"ruby, rails")
Talk.create(title:"Title 3", description:"Description 3", duration:"3", speaker:"Three", state:"pending", tag_list:"ruby, perl, elixir")
Talk.create(title:"Title 4", description:"Description 4", duration:"4", speaker:"Four", state:"pending", tag_list:"ruby, javascript, rust")
Talk.create(title:"Title 5", description:"Description 5", duration:"5", speaker:"Five", state:"pending", tag_list:"ruby, javascript, ember")
