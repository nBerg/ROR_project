class Lecture
  include Mongoid::Document
  
  embedded_in :course
  embeds_many :assignments
  embeds_many :uploads

  field :num, type: Integer
  field :title, type: String
  field :content, type: String
  field :content_html, type: String

end
