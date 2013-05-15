class Assignment
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  embedded_in :lecture

  field :title, type: String
  field :content, type: String
  field :due, type: Date

	before_save { title.capitalize! }

  validates :tile, presence: true
  validates :due, presence: true
end
