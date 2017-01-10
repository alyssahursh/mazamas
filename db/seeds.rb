# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# All Education Programs
EducationProgram.create(abbreviation: "BCEP", name: "Basic Climbing Education Program", description: "")
EducationProgram.create(abbreviation: "ICS",  name: "Intermediate Climbing School",     description: "")
EducationProgram.create(abbreviation: "MFA",  name: "Mountaineering First Aid",         description: "")
EducationProgram.create(abbreviation: "AR",   name: "Advanced Rock",                    description: "")
EducationProgram.create(abbreviation: "ASI",  name: "Advanced Snow and Ice",            description: "")
EducationProgram.create(abbreviation: "SM",   name: "Ski Mountaineering",               description: "")

# All User Roles
UserRole.create(role: "Climber",              description: "General role for all climbers")
UserRole.create(role: "Climb Leader",         description: "Full climb leader, no restrictions")
UserRole.create(role: "A-Level Climb Leader", description: "Climb leader restricted to A-level climbs")
UserRole.create(role: "Provisional Leader",   description: "Provisional leader; requires Climb Leader-level assistant")
UserRole.create(role: "Leader Candidate",     description: "Leadership development candidate")
UserRole.create(role: "Admin",                description: "Adminstration role for staff and volunteers")

# All ClimbClasses

# All ClimbTags

# Sample Climb Schedules
ClimbSchedule.create(season: "Winter", year: 2016-2017)
ClimbSchedule.create(season: "Summer", year: 2017)
ClimbSchedule.create(season: "Winter", year: 2017-2018)
ClimbSchedule.create(season: "Summer", year: 2018)
