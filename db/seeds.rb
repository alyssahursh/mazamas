# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# All Education Programs
EducationProgram.create(abbreviation: "BCEP", name: "Basic Climbing Education Program", description: "")
EducationProgram.create(abbreviation: "ICS",  name: "Intermediate Climbing School",     description: "")
EducationProgram.create(abbreviation: "MFA",  name: "Mountaineering First Aid",         description: "")
EducationProgram.create(abbreviation: "AR",   name: "Advanced Rock",                    description: "")
EducationProgram.create(abbreviation: "ASI",  name: "Advanced Snow and Ice",            description: "")
EducationProgram.create(abbreviation: "SM",   name: "Ski Mountaineering",               description: "")
EducationProgram.create(abbreviation: "FM",   name: "Families Mountaineering",          description: "")

# All User Roles
UserRole.create(role: "Climber",              description: "General role for all climbers")
UserRole.create(role: "Climb Leader",         description: "Full climb leader, no restrictions")
UserRole.create(role: "A-Level Climb Leader", description: "Climb leader restricted to A-level climbs")
UserRole.create(role: "Provisional Leader",   description: "Provisional leader; requires Climb Leader-level assistant")
UserRole.create(role: "Leader Candidate",     description: "Leadership development candidate")
UserRole.create(role: "Admin",                description: "Adminstration role for staff and volunteers")

# All ClimbClasses (RouteGrades)
ClimbClass.create(code: "A", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, and self-arrest. (examples: Mt. St. Helens, Mt Adams)")
ClimbClass.create(code: "B", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, and roped climbing. (examples: Mt. Hood South Side, Middle Sister)")
ClimbClass.create(code: "C", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, roped climbing, crevasse rescue skills, belaying, rappelling, and low 5th class rock climbing. (examples: DC and Emmons on Mt. Rainier, Mt Washington in Oregon)")
ClimbClass.create(code: "D", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, roped climbing, crevasse rescue skills, belaying, rappelling, with potential travel on steep snow slopes or 5th class rock climbing. (examples: West Ridge of Mt. Stuart, Sandy Glacier Headwall on Mt Hood)")
ClimbClass.create(code: "E", description: "Multi-pitch technical routes with high degree of self-sufficiency and proficiency using technical skills under high exposure, sharing high angle leads, setting protection and anchors.  (examples: North ridge of Mt. Stuart, Beckey Route, Liberty Bell)")

# All ClimbTags
ClimbTag.create(code: "Base Camp",                  description: "Multi-day climb with pack-in to base camp.")
ClimbTag.create(code: "Classic Climbers",           description: "Climbers 55 years of age and older are given preference")
ClimbTag.create(code: "Exploratory",                description: "The leader has not previously climbed this route")
ClimbTag.create(code: "Family",                     description: "Kid friendly climb at a moderate pace")
ClimbTag.create(code: "Hike to the Summit",         description: "Nonmembers given preference for glaciated peak climb")
ClimbTag.create(code: "Linked Climbs",              description: "Two or more climbs from the same base camp. Climbers must apply to all related climbs")
ClimbTag.create(code: "Adjacent Climbs",            description: "Two or more climbs in a similar area. Climbers may apply to one or all.")
ClimbTag.create(code: "Ski Mountaineering",         description: "Backcountry skie or snowboard gear required")
ClimbTag.create(code: "Adventurous Young Mazamas",  description: "For those young or young at heart")

# Sample Climb Schedules
ClimbSchedule.create(season: "Winter", year: 2016-2017)
ClimbSchedule.create(season: "Summer", year: 2017)
ClimbSchedule.create(season: "Winter", year: 2017-2018)
ClimbSchedule.create(season: "Summer", year: 2018)

# Use Faker to create 100 users
100.times do |x|
  statuses = ["nonmember", "active", "lapsed"]
  climber = User.create(
    first_name:             Faker::Name.first_name,
    last_name:              Faker::Name.last_name,
    email:                  Faker::Internet.email,
    phone:                  Faker::PhoneNumber.phone_number,
    emergency_contact:      Faker::Name.name,
    emergency_phone:        Faker::PhoneNumber.phone_number,
    birthdate:              Faker::Date.between(80.years.ago, 20.years.ago),
    address1:               Faker::Address.street_address,
    address2:               Faker::Address.secondary_address,
    city:                   Faker::Address.city,
    state:                  Faker::Address.state_abbr,
    zip:                    Faker::Address.zip,
    membership_status:      statuses[rand(0..2)],
    user_roles:             [UserRole.find_by_role("Climber")]
  )
  ClimberProfile.create(
    user:                   climber,
    bio:                    Faker::Lorem.paragraph,
    physical_conditioning:  Faker::Lorem.paragraph(2, true, 2),
    medical_condition:      Faker::Lorem.paragraph(0, true, 2),
    medication:             Faker::Lorem.sentence(0, true, 6),
    volunteer_history:      Faker::Lorem.paragraph(0, true, 4)
  )
end


# CSV.foreach('db/leader_data.csv', headers: true) do |line|
#    puts line
#    climb_leader = User.create(
#     first_name:             line[0],
#     last_name:              line[1],
#     email:                  Faker::Internet.email,
#     phone:                  Faker::PhoneNumber.phone_number,
#     emergency_contact:      Faker::Name.name,
#     emergency_phone:        Faker::PhoneNumber.phone_number,
#     birthdate:              Faker::Date.between(80.years.ago, 20.years.ago),
#     address1:               Faker::Address.street_address,
#     address2:               Faker::Address.secondary_address,
#     city:                   Faker::Address.city,
#     state:                  Faker::Address.state_abbr,
#     zip:                    Faker::Address.zip,
#     # membership_status:      statuses[0],
#     user_roles:             [UserRole.find_by_role("Climber"), UserRole.find_by_role("Climb Leader")]
#   )
#   ClimberProfile.create(
#     user:                   climb_leader,
#     bio:                    Faker::Lorem.paragraph,
#     physical_conditioning:  Faker::Lorem.paragraph(2, true, 2),
#     medical_condition:      Faker::Lorem.paragraph(0, true, 2),
#     medication:             Faker::Lorem.sentence(0, true, 6),
#     volunteer_history:      Faker::Lorem.paragraph(0, true, 4)
#   )
#   ClimbLeaderProfile.create(
#     user:                   climb_leader,
#     climbing_since:         line[3],
#     leader_since:           line[4],
#     pace:                   line[6],
#     climb_preferences:      line[7],
#     volunteer_history:      line[8],
#     climb_achievements:     line[9],
#     climb_philsophy:        line[10],
#     summit_treat:           line[11],
#     bio:                    line[12],
#     photo_link:             line[2]
#   )
# end
#
CSV.foreach('db/mountain_data.csv', headers: true) do |line|
  Mountain.create(
    name:                   line[0],
    state:                  line[1],
    country:                line[2],
    continent:              line[3],
    summit_post_url:        line[4],
    latitude:               line[5],
    longitude:              line[6],
    google_maps_url:        line[7],
    summit_post_name:       line[8],
    elevation_feet:         line[9],
    elevation_meters:       line[10]
  )
end

# CSV.foreach('db/route_data.csv', headers: true) do |line|
#   Route.create(
#     # begin
#     #   mountain_id:            Mountain.find_by_name(line[0]),
#     # rescue
#     #   puts "Failed on #{line[0]}"
#     # end
#     #
#     # begin
#     #   secondary_peak:         Mountain.find_by_name(line[1]),
#     # rescue
#     #   puts "Failed on #{line[0]}"
#     # end
#
#     name:                   line[2],
#     climb_class:            ClimbClass.find_by_code(line[3]),
#     elevation_gane:         line[4],
#     driving_distance:       line[5],
#     driving_time:           line[6],
#     typical_duration:       line[7],
#     typical_season:         line[8],
#     glaciated_peak:         line[9],
#     rock_class:             line[10],
#     snow_angle:             line[11],
#     rapelling:              line[12],
#     crevasse_rescue:        line[13],
#     typical_gear:           line[14],
#     notes:                  line[15],
#     guidebooks:             line[16],
#     phone_numbers:          line[17]
#   )
# end
