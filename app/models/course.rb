class Course
  include Mongoid::Document

  embeds_many :lectures
  has_and_belongs_to_many :users

  field :c_num, type: String
  field :name, type: String
end
