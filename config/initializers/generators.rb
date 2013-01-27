# Use active_record for migrations
IntegracaoIME::Application.config.generators do |g|
  g.orm :active_record
end
