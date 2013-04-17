namespace :import do

	desc "Import courses from courses.csv"
	task :import_courses_csv => :environment do
		require 'csv'

		puts "importing courses to database"

		CSV.foreach("#{Rails.root}/courses.csv", :headers => true) do |row|
			Course.create!(row.to_hash)
		end

	end #task import_courses_csv

end #namespace import
