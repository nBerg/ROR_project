class Assignment
  include Mongoid::Document

  embedded_in :lecture

  field :content, type: String
  field :due, type: Date
end
