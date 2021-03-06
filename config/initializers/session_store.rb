# Be sure to restart your server when you modify this file.

# IntegracaoIME::Application.config.session_store :cookie_store, key: '_IntegracaoIME_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
#IntegracaoIME::Application.config.session_store :active_record_store

# Simple cache for development
if Rails.env.development?
  IntegracaoIME::Application.config.session_store :cache_store
end
