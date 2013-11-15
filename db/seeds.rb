# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## create admin users
if User.count == 0
  User.create(first_name: 'Henry', last_name: 'Díaz', role: 'admin', email: 'henry@gobiernoabierto.gob.sv', password: 'payaso21')
  User.create(first_name: 'Ismael', last_name: 'Rodríguez', role: 'admin', email: 'ismael@gobiernoabierto.gob.sv', password: 'payaso21')
end
