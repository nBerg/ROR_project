class Upload
  include Mongoid::Document

  embedded_in :lecture

  field :name, type: String
  field :path, type: String
end
