class Assignment
  include Mongoid::Document

  embedded_in :lecture

  field :title, type: String
  field :content, type: String
  field :due, type: Date
end
