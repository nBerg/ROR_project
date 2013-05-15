class User
  include Mongoid::Document

  has_and_belongs_to_many :courses

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :role, type: String, default: 'Student'

  before_save { email.downcase! }
  before_save { first_name.capitalize! }
  before_save { last_name.capitalize! }

  validates :first_name, :last_name, presence: true, 
                                    length: { maximum: 50 }

  validates :email, presence: true, 
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
                    uniqueness: { case_sensitive: false },
                    confirmation: true

  validates :email_confirmation, presence: true

  validates :role, inclusion: { in: ['Student', 'Admin'] }

end
