# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_groopbuyr_session',
  :secret      => 'c78363d1a5efdc7eb97168a644dbead8204babcdbd9af093d9d1517ed4951b2e3535984f0dea892ac6c726fa3823a8eed86c993c761370f5ad8dbe8722710d8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
