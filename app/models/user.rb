class User
  include Mongoid::Document

  has_and_belongs_to_many :courses

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :admin, type: Boolean, default: false

  validates_presence_of :first_name, :last_name
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  validates_uniqueness_of :first_name, :last_name, :email, :case_sensitive => false
end
