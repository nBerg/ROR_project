class Course
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  embeds_many :lectures
  embeds_many :announcements
  has_and_belongs_to_many :users

  field :Call_Number, type: Integer
  field :Course_Title, type: String
  field :Start_Time, type: Time
  field :End_Time, type: Time
  field :Meets_On, type: String
  field :Building, type: String
  field :Room, type: String
  field :Instructor, type: String
  field :Num_Lectures, type: Integer, default: 0

  validates :Course_Title, :presence => true

end
