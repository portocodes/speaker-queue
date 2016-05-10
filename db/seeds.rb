# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "admin", email: 'admin@portocodes.com', role: 'admin')
User.create(name: "moderator", email: 'moderator@portocodes.com', role: 'moderator' )
User.create(name: "coder", email: 'coder@portocodes.com', role: 'coder')

Talk.create(
  title:"Lorem ipsum sit amet",
  description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id sollicitudin sem. Sed at mollis leo, in scelerisque ante. Vestibulum et pulvinar purus. Aliquam vitae porta sapien. Vivamus sollicitudin, urna sit amet convallis imperdiet, nulla arcu lobortis elit, vel tincidunt tellus justo vel orci. Suspendisse vitae tortor congue, porttitor metus non, consequat nisi. Nam fermentum dictum erat sed consequat. Aliquam porta mauris vel sodales viverra. Nam vitae lacus risus. Vestibulum aliquam sit amet mauris vitae aliquet.",
  duration:"30",
  speaker:"Aliquam amet",
  state:"approved",
  tag_list:"ruby, javascript",
  location_name: "A Badalhoca",
  location_coordinates: "http://www.google.com",
  user_id: 2
)

Talk.create(
  title:"Consectetur adipiscing",
  description:"Vivamus dignissim sapien non ligula bibendum sollicitudin. Nulla pretium vel lorem sed dapibus. In tellus urna, posuere vitae tincidunt sit amet, commodo sed velit. Etiam id orci eget eros rutrum convallis. Mauris sed vestibulum enim. Fusce fringilla leo metus, et blandit metus ultrices a. Donec id ante dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id sollicitudin sem. Sed at mollis leo, in scelerisque ante. Vestibulum et pulvinar purus. Aliquam vitae porta sapien. Vivamus sollicitudin, urna sit amet convallis imperdiet, nulla arcu lobortis elit, vel tincidunt tellus justo vel orci. Suspendisse vitae tortor congue, porttitor metus non, consequat nisi. Nam fermentum dictum erat sed consequat. Aliquam porta mauris vel sodales viverra. Nam vitae lacus risus. Vestibulum aliquam sit amet mauris vitae aliquet.",
  duration:"120",
  speaker:"Lorem Ipsum",
  state:"approved",
  tag_list:"ruby, php, css",
  location_name: "Guedes",
  location_coordinates: "http://www.sapo.pt",
  user_id: 2
)

Talk.create(
  title:"Phasellus gravida sit amet vitrai",
  description:"Vivamus dignissim sapien non ligula bibendum sollicitudin. Nulla pretium vel lorem sed dapibus. In tellus urna, posuere vitae tincidunt sit amet, commodo sed velit. Etiam id orci eget eros rutrum convallis. Mauris sed vestibulum enim. Fusce fringilla leo metus, et blandit metus ultrices a. Donec id ante dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.",
  duration:"40",
  speaker:"Phasellus Amet",
  state:"approved",
  tag_list:"php, javascript, css",
  location_name: "Conga",
  location_coordinates: "http://www.amazon.com",
  user_id: 2
)

Talk.create(
  title:"Phasellus gravida sit amet vitrai",
  description:"Vivamus dignissim sapien non ligula bibendum sollicitudin. Nulla pretium vel lorem sed dapibus. In tellus urna, posuere vitae tincidunt sit amet, commodo sed velit. Etiam id orci eget eros rutrum convallis. Mauris sed vestibulum enim. Fusce fringilla leo metus, et blandit metus ultrices a. Donec id ante dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.",
  duration:"15",
  speaker:"Phasellus Amet",
  state:"pending",
  tag_list:"rust, wordpress, css",
  location_name: "Conga",
  location_coordinates: "http://www.amazon.com",
  user_id: 3
)

Talk.create(
  title:"Phasellus gravida sit amet vitrai",
  description:"Vivamus dignissim sapien non ligula bibendum sollicitudin. Nulla pretium vel lorem sed dapibus. In tellus urna, posuere vitae tincidunt sit amet, commodo sed velit. Etiam id orci eget eros rutrum convallis. Mauris sed vestibulum enim. Fusce fringilla leo metus, et blandit metus ultrices a. Donec id ante dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.",
  duration:"20",
  speaker:"Joaquim da Vida",
  state:"delayed",
  tag_list:"erlang, elixir",
  location_name: "Conga",
  location_coordinates: "http://www.amazon.com",
  user_id: 3
)