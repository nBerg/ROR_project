module ApplicationHelper

	def markdown(text)
  	render_options = [:hard_wrap => true, :filter_html => true]
  	options = [:no_intra_emphasis => true, :fenced_code_blocks => true, :autolink => true, :strikethrough => true, :space_after_header => true, :superscript => true, :underline => true]
  	renderer = Redcarpet::Render::HTML.new(*render_options)
  	markdown = Redcarpet::Markdown.new(renderer, *options)
  	markdown.render(text).html_safe
  end

end
