class Assignment
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes


  embedded_in :lecture

  field :title, type: String
  field :content, type: String
  field :due, type: Date
end
