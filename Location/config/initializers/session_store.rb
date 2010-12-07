# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_checho_session',
  :secret      => '9ddff09c1b8e57c6170961743a3bb6dadcc9fc2e0bf98c98c9b387a1e1a7827f9516f49cd0cd35d13ce33e86a761de1435d14f934a48f9e3dd0aa42154dc3aa8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
