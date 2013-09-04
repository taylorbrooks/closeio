### A Ruby wrapper for the Close.IO API

Learn about the Closeio API at http://developer.close.io.

### Installation
````ruby
  gem install closeio
````

### Examples
````ruby
  # Find a specific lead
  lead = Closeio::Lead.find 'lead_xxxxxxxxxxxx'
  
  # See some data about the lead
  lead.addresses
  lead.contacts
  lead.opportunities

  # Find leads that match  fields
  Closeio::Lead.where query: 'custom.current_system:[Simple Donation]'

  # Saved Search (SmartView)
  saved_search = Closeio::SavedSearch.first
  saved_search.leads
````

### Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

### Copyright

Copyright (c) 2013 Taylor Brooks. See LICENSE for details.
