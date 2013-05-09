namespace :import do

	desc "Import courses from courses.csv"
	task :import_courses_csv => :environment do
		require 'csv'

		puts "importing courses to database"

		CSV.foreach("#{Rails.root}/courses.csv", :headers => true) do |row|
			Course.create!(row.to_hash)
		end
	end #task import_courses_csv

	desc "Import users from users.csv"
	task :import_users_csv => :environment do
		require 'csv'

		puts "importing users to database"

		CSV.foreach("#{Rails.root}/users.csv", :headers => true) do |row|
			User.create!(row.to_hash)
		end
	end #task import_users_csv

	desc "Fill database with sample users"
	task :populate_users => :environment do
		100.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "example-#{n+1}@gmail.com"
			User.create!(first_name: first_name,
									 last_name: last_name,
									 email: email,
									 email_confirmation: email)
		end
	end #task populate_users

end #namespace import
