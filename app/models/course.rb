class Course
  include Mongoid::Document

  embeds_many :lectures
  has_and_belongs_to_many :users

  field :CallNumber, type: Integer
  field :CourseTitle, type: String
  field :StartTime1, type: String
  field :EndTime1, type: String
  field :MeetsOn1, type: String
  field :Building1, type: String
  field :Room1, type: String
  field :Instructor1Name, type: String
end
