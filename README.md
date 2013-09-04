### A Ruby wrapper for the Close.IO API

Learn about the Closeio API at http://developer.close.io.

### Installation
Add this line to your application's Gemfile:
  gem 'closeio'

And then execute:
  $ bundle

Or install it yourself as:
  $ gem install closeio

### Usage
````ruby
  # Find a specific lead
  lead = Closeio::Lead.find 'lead_xxxxxxxxxxxx'
  
  # See some data about the lead
  lead.addresses
  lead.contacts
  lead.opportunities

  # Find leads that match fields
  Closeio::Lead.where query: 'custom.current_system:[Simple Donation]'

  # Saved Search (SmartView)
  saved_search = Closeio::SavedSearch.first
  saved_search.leads
````

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


### Copyright
Copyright (c) 2013 Taylor Brooks. See LICENSE for details.