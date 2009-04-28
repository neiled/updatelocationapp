# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_updatelocationapp_session',
  :secret      => 'dc6259687f1751d4198286a63529bdf5b625322fc1fb31f9e6baa54f0eaecd660f98b407be6bdb16db1356a97c79fa424a337f270dfbdc0142b8b8c06bc1650d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
