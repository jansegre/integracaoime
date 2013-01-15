# Put Haml configs here
Haml::Template.options[:attr_wrapper] = '"'

# Use HTML5 standards
Haml::Template.options[:format] = :html5

# Allow Haml assets in the asset pipeline.
Rails.application.assets.register_mime_type 'text/html', '.html'
Rails.application.assets.register_engine '.haml', Tilt::HamlTemplate

class Tilt::HamlTemplate
  def prepare
    options = @options.merge(:filename => eval_file, :line => line)
    # Use same options as Haml::Template
    options = options.merge Haml::Template.options
    @engine = ::Haml::Engine.new(data, options)
  end
end

