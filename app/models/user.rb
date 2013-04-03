class User
  include Mongoid::Document

  has_and_belongs_to_many :courses

  field :login, type: String
  field :pass, type: String
  field :f_name, type: String
  field :l_name, type: String
end
