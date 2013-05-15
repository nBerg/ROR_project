class Announcement
  include Mongoid::Document

  embedded_in :course
  
  field :title, type:String
  field :content, type: String
  field :Date, type: Date

  before_save { self.Date = DateTime.now }
  before_save { title.capitalize! }

  validates :title, presence: true
  
end
