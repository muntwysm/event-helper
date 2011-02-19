# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_events_session',
  :secret      => '1326207451f23edd17ddc900a784883dc26578aa8f742dc1564084c3b7e7596484fe6a3c57545d3f9a0c37a8d86aa548152f892858bbc60b314a5d4c83b8692a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
