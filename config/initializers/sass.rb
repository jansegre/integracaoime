Sass::Engine::DEFAULT_OPTIONS[:load_paths].tap do |load_paths|
  load_paths << Rails.root.join('app/assets/stylesheets')
end
