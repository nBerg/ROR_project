# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Empty the database
Mongoid.purge!
#Mongoid.default_session.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

# Populate databse with some users and courses
Rake::Task['import:import_users_csv'].invoke
Rake::Task['import:import_courses_csv'].invoke

# Create some random relationships
20.times do
	c = Course.all.sample # find a random course
	u = User.all.sample # find a random user
	c.users << u unless c.users.include?(u) # create relationship, unless they are already related, to prevent duplicates
  u.courses << c unless u.courses.include?(c)
end