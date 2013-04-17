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

end #namespace import
