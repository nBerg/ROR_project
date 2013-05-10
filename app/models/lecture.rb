class Lecture
  include Mongoid::Document

  embedded_in :course
  embeds_many :assignments
  embeds_many :uploads

  field :num, type: Integer
  field :title, type: String
  field :content, type: String
  field :content_html, type: String

  before_save :generate_content_html

  protected

  	def generate_content_html
  		return if content.blank?
  		render_options = [:hard_wrap => true, :filter_html => true]
  		options = [:no_intra_emphasis => true, :fenced_code_blocks => true, :autolink => true, :strikethrough => true, :space_after_header => true, :superscript => true, :underline => true]
  		renderer = Redcarpet::Render::HTML.new(*render_options)
  		markdown = Redcarpet::Markdown.new(renderer, *options)
  		self.content_html = markdown.render(content)
  	end

end
