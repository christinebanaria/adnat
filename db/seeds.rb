# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Organisation.create(name: 'Bob''s Burgers', hourly_rate: 10.0)
Organisation.create(name: 'Moe''s Tavern', hourly_rate: 20.0)
Organisation.create(name: 'Shades and Spices', hourly_rate: 15.0)

Shift.create(user_id: 1, start: '2019-02-07 10:15:00', finish: '2019-02-07 13:30:00', break_length: 0)
Shift.create(user_id: 2, start: '2019-02-05 09:00:00', finish: '2019-02-05 13:00:00', break_length: 30)
Shift.create(user_id: 3, start: '2019-01-31 11:00:00', finish: '2019-01-31 23:00:00', break_length: 60)
