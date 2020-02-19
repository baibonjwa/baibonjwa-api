# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by_name_and_email(
  name: 'Test',
  email: 'test@test.com',
)

User.find_or_create_by_name_and_email(
  name: 'Test2',
  email: 'test2@test.com',
)

if WebglExample.count == 0
  WebglExample.create([{
    identifier: "oneTweetTunnel",
    name: "One Tweet Tunnel",
    description: "One tweet tunnel",
    public_path: "/public/one-tweet-tunnel"
  }, {
    identifier: "tunnel",
    name: "2D Tunnel",
    description: "Simple 2D tunnel with crossfading between two textures",
    public_path: "/public/tunnel"
  }]);
end