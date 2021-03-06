# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
# # require 'csv'
# #
#
# # rake db:schema:dump && rake db:drop && rake db:create && rake db:migrate && rake db:seed
#
#

require 'faker'

# All Education Programs
Education.create(abbreviation: "BCEP", name: "Basic Climbing Education Program", description: "")
Education.create(abbreviation: "ICS",  name: "Intermediate Climbing School",     description: "")
Education.create(abbreviation: "MFA",  name: "Mountaineering First Aid",         description: "")
Education.create(abbreviation: "AR",   name: "Advanced Rock",                    description: "")
Education.create(abbreviation: "ASI",  name: "Advanced Snow and Ice",            description: "")
Education.create(abbreviation: "SM",   name: "Ski Mountaineering",               description: "")
Education.create(abbreviation: "FM",   name: "Families Mountaineering",          description: "")
puts "Seeded Education Programs. Total Education Count: #{Education.all.length}"

# All User Roles
UserRole.create(role: "Climber",              description: "General role for all climbers")
UserRole.create(role: "Climb Leader",         description: "Full climb leader, no restrictions")
UserRole.create(role: "A-Level Climb Leader", description: "Climb leader restricted to A-level climbs")
UserRole.create(role: "Provisional Leader",   description: "Provisional leader; requires Climb Leader-level assistant")
UserRole.create(role: "Leader Candidate",     description: "Leadership development candidate")
UserRole.create(role: "Admin",                description: "Adminstration role for staff and volunteers")
puts "Seeded User Roles. Total User Roles: #{UserRole.all.length}"


# All ClimbClasses (RouteGrades)
ClimbClass.create(code: "A", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, and self-arrest. (examples: Mt. St. Helens, Mt Adams)")
ClimbClass.create(code: "B", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, and roped climbing. (examples: Mt. Hood South Side, Middle Sister)")
ClimbClass.create(code: "C", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, roped climbing, crevasse rescue skills, belaying, rappelling, and low 5th class rock climbing. (examples: DC and Emmons on Mt. Rainier, Mt Washington in Oregon)")
ClimbClass.create(code: "D", description: "May require off-trail hiking, ice axe and crampon use on moderately steep slopes, self-arrest, as well as glacier travel, roped climbing, crevasse rescue skills, belaying, rappelling, with potential travel on steep snow slopes or 5th class rock climbing. (examples: West Ridge of Mt. Stuart, Sandy Glacier Headwall on Mt Hood)")
ClimbClass.create(code: "E", description: "Multi-pitch technical routes with high degree of self-sufficiency and proficiency using technical skills under high exposure, sharing high angle leads, setting protection and anchors.  (examples: North ridge of Mt. Stuart, Beckey Route, Liberty Bell)")
puts "Seeded Climb Classes. Total Climb Classes: #{ClimbClass.all.length}"


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
puts "Seeded Climb Tags. Total Climb Tags: #{ClimbTag.all.length}"


# Sample Climb Schedules
ClimbSchedule.create(season: "Winter", year: 2017)
ClimbSchedule.create(season: "Summer", year: 2017)
ClimbSchedule.create(season: "Winter", year: 2018)
ClimbSchedule.create(season: "Summer", year: 2018)
puts "Seeded Climb Schedules. Total Climb Schedules: #{ClimbSchedule.all.length}"

leader_count = 0

CSV.foreach('db/leader_data.csv', headers: true) do |line|

  leader_count += 1

  climb_leader = User.create(
    first_name:             line[0],
    last_name:              line[1],
    password:               'password',
    email:                  "leader#{leader_count}@mazamasclimbs.org",
    phone:                  Faker::PhoneNumber.phone_number,
    emergency_contact:      Faker::Name.name,
    emergency_phone:        Faker::PhoneNumber.phone_number,
    birthdate:              Faker::Date.between(80.years.ago, 20.years.ago),
    address1:               Faker::Address.street_address,
    address2:               Faker::Address.secondary_address,
    city:                   Faker::Address.city,
    state:                  Faker::Address.state_abbr,
    zip:                    Faker::Address.zip,
    membership_status:      "active",
    autorenew:              true,
    membership_expiration:  Faker::Date.between(Date.today, 1.year.from_now),
    user_roles:             [UserRole.find_by_role("Climber"), UserRole.find_by_role("Climb Leader")]
  )

  # Add the user's climber profile
  ClimberProfile.create(
    user:                   climb_leader,
    bio:                    Faker::Lorem.paragraph,
    physical_conditioning:  Faker::Lorem.paragraph(2, true, 2),
    medical_condition:      Faker::Lorem.paragraph(0, true, 2),
    medication:             Faker::Lorem.sentence(0, true, 6),
    volunteer_history:      Faker::Lorem.paragraph(0, true, 4)
  )

  # Add the user's leader profile
  ClimbLeaderProfile.create(
    user:                   climb_leader,
    climbing_since:         line[3],
    leader_since:           line[4],
    pace:                   line[6],
    climb_preferences:      line[7],
    volunteer_history:      line[8],
    climb_achievements:     line[9],
    climb_philosophy:       line[10],
    summit_treat:           line[11],
    bio:                    line[12],
    photo_link:             line[2]
  )
end
puts "Seeded Climb Leader Users. Total Users is now: #{User.all.length}"
puts "Seeded Climb Leader Climber Profiles. Total Climber Profiles is now: #{ClimberProfile.all.length}"
puts "Seeded Climb Leader Profiles. Total Climb Leader Profiles: #{ClimbLeaderProfile.all.length}"


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
    elevation_meters:       line[10],
    driving_distance:       line[11],
    driving_time:           line[12],
    glaciated:              line[13]
  )
end
puts "Seeded Mountains. Total Mountains: #{Mountain.all.length}"


CSV.foreach('db/route_data_3.csv', headers: true) do |line|
  # begin
    # puts line[0], line[2]

    secondary_peak_id = nil
    if !line[1].nil?
      begin
        secondary_peak_id = Mountain.find_by_name(line[1]).id
      rescue
        puts "Couldn't find secondary peak #{line[1]}"
      end
    end

    if Mountain.find_by_name(line[0]).nil?
      puts "Couldn't find primary peak #{line[0]}"
    end

    Route.create(
      mountain:               Mountain.find_by_name(line[0]),
      secondary_peak:         secondary_peak_id,
      name:                   line[2],
      climb_class:            ClimbClass.find_by_code(line[3]),
      elevation_gain:         line[4],
      typical_duration:       line[7],
      typical_season:         line[8],
      rock_class:             line[10],
      snow_angle:             line[11],
      rappelling:             line[12],
      crevasse_rescue:        line[13],
      typical_gear:           line[14].downcase,
      notes:                  line[15],
      guidebooks:             line[16],
      phone_numbers:          line[17]
    )
  # rescue
  #   puts "Failed on #{line[2]} route for #{line[0]}, sp: #{line[1]}"
  # end
end
puts "Seeded Routes. Total Routes: #{Route.all.length}"





# Use Faker to create 100 users
100.times do |x|
  statuses = ["nonmember", "active", "lapsed"]
  random_status = statuses[rand(0..2)]
  truefalse = [true, false]

  if random_status == "active"
    autorenewal = truefalse[rand(0..1)]
    membership_expiration = Faker::Date.between(Date.today, 1.year.from_now)
  else
    autorenewal = false
    membership_exipration = nil
  end

  climber = User.create(
    first_name:             Faker::Name.first_name,
    last_name:              Faker::Name.last_name,
    password:               'password',
    email:                  "climber#{x}@mazamasclimbs.org",
    phone:                  Faker::PhoneNumber.phone_number,
    emergency_contact:      Faker::Name.name,
    emergency_phone:        Faker::PhoneNumber.phone_number,
    birthdate:              Faker::Date.between(80.years.ago, 20.years.ago),
    address1:               Faker::Address.street_address,
    address2:               Faker::Address.secondary_address,
    city:                   Faker::Address.city,
    state:                  Faker::Address.state_abbr,
    zip:                    Faker::Address.zip,
    membership_status:      random_status,
    autorenew:              autorenewal,
    membership_expiration:  membership_expiration,
    user_roles:             [UserRole.find_by_role("Climber")],
    credits:                rand(0..4),
  )
  climber_profile = ClimberProfile.create(
    user:                   climber,
    bio:                    Faker::Lorem.paragraph,
    physical_conditioning:  Faker::Lorem.paragraph(2, true, 2),
    medical_condition:      Faker::Lorem.paragraph(0, true, 2),
    medication:             Faker::Lorem.sentence(0, true, 6),
    volunteer_history:      Faker::Lorem.paragraph(0, true, 4)
  )
  rand(3..20).times do |x|
    mountain = Mountain.find(rand(1..Mountain.all.length))
    mountain_name = mountain.name
    possible_roles = ["Climber", "Climber", "Climber", "Climber", "Assistant", "Climber"]
    climb_leader = ClimbLeaderProfile.find(rand(1..ClimbLeaderProfile.all.length)).user
    climb_leader_name = "#{climb_leader.first_name} #{climb_leader.last_name}"
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    climb_type = ["mazamas", "private", "other"]

    if mountain.routes.length != 0
      route_count = mountain.routes.length
      route_name = mountain.routes[rand(0...route_count)].name
    else
      route_name = ""
    end

    ClimberExperience.create(
      climber_profile:      climber_profile,
      month:                months[rand(0...possible_roles.length)],
      year:                 rand(2000..2017),
      mountain:             mountain_name,
      route:                route_name,
      role:                 possible_roles[rand(0...possible_roles.length)],
      climb_leader:         climb_leader_name,
      climb_type:           climb_type[rand(0...climb_type.length)]
    )
  end

  education_count = rand(1..Education.all.length)
  education_count.times do |x|
    ClimberEducation.create(
      climber_profile:      climber_profile,
      education:            Education.find(x+1),
      education_leader:     ClimbLeaderProfile.find(rand(1..ClimbLeaderProfile.all.length)).user,
      year:                 rand(2000..2017)
    )
  end

end
puts "Seeded Users. Total Users: #{User.all.length}"
puts "Seeded Climber Profiles. Total Climber Profiles: #{ClimberProfile.all.length}"
puts "Seeded Climber Experience. Total Experiences: #{ClimberExperience.all.length}"
puts "Seeded Climber Educations. Total Educations: #{ClimberEducation.all.length}"




climb_app_status = ["applied", "accepted", "rejected", "waitlist"]

300.times do |x|
  random_date = Faker::Date.forward(rand(100..200))
  climb = Climb.create(
    climb_status:             "open",
    description:              Faker::Lorem.paragraph,
    specific_date:            SpecificDate.new(
                                climb:  climb,
                                date_leave_town: random_date,
                                date_leave_trailhead: random_date + rand(0..1),
                                date_return_town: random_date + rand(0..1),
                                date_return_trailhead: random_date + rand(0..1),
                                date_summit: random_date + rand(0..1)
                              ),
    last_updated:             Time.now,
    party_size:               rand(6..13),
    route:                    Route.find(rand(1..Route.all.length)),
    educations:               [Education.find(rand(1..Education.all.length))],
    climb_schedule:           ClimbSchedule.find(2),
    leader_1:                 ClimbLeaderProfile.find(rand(1..ClimbLeaderProfile.all.length)).user,
    assistant_1:              ClimberProfile.find(rand(1..ClimberProfile.all.length)).user
  )
  rand(3..20).times do |x|
    ClimbApp.create(
      climb:                    climb,
      user:                     User.find(rand(1..User.all.length)),
      climb_app_status:      climb_app_status[rand(0..climb_app_status.length)]
    )
  end
end
puts "Seeded Leader and Climber ClimbApps. Total ClimbApps: #{ClimbApp.all.length}"
puts "Seeded Open Summer Climbs. Total Climbs: #{Climb.all.length}"
puts "Seeded Specific Dates. Total Dates: #{SpecificDate.all.length}"

50.times do |x|
  winter_months = ["october", "november", "december"]
  climb = Climb.create(
    climb_status:             "open",
    description:              Faker::Lorem.paragraph,
    general_date:             GeneralDate.new(
                                climb:  climb,
                                climb_month:    winter_months[rand(0..2)],
                                climb_year:     2017
                              ),
    last_updated:             Time.now,
    party_size:               rand(6..13),
    route:                    Route.find(rand(1..Route.all.length)),
    educations:               [Education.find(rand(1..Education.all.length))],
    climb_schedule:           ClimbSchedule.find(3),
    leader_1:                 ClimbLeaderProfile.find(rand(1..ClimbLeaderProfile.all.length)).user,
    assistant_1:              ClimberProfile.find(rand(1..ClimberProfile.all.length)).user
  )
  rand(3..20).times do |x|
    ClimbApp.create(
      climb:                    climb,
      user:                     User.find(rand(1..User.all.length)),
      climb_app_status:      climb_app_status[rand(0..climb_app_status.length)]
    )
  end
end
puts "Seeded Leader and Climber ClimbApps. Total ClimbApps: #{ClimbApp.all.length}"
puts "Seeded Open Winter Climbs. Total Climbs: #{Climb.all.length}"
puts "Seeded Specific Dates. Total Dates: #{GeneralDate.all.length}"
