### A Ruby wrapper for the Close.IO API

Learn about the Closeio API at http://developer.close.io.

I :heart: Close.io, so if you have problems using the gem or would like to see support for new endpoints, please open a GitHub issue -- I'll get it resolved as quick as I can.

### Installation
Add this line to your application's Gemfile:
````ruby
  # in your Gemfile
  gem 'closeio'

  # then...
  bundle install

  # Set your Api Key (`config/initializers/closeio.rb` or `config/environment/*.rb`)
  Closeio.configure("xxxxxx")
````

### Usage
````ruby
  # Find a specific lead
  lead = Closeio::Lead.find('lead_xxxxxxxxxxxx')

  # See some data about the lead
  lead.addresses
  lead.contacts
  lead.opportunities

  # Find leads that match fields
  Closeio::Lead.where(query: 'custom.current_system:[Simple Donation]')

  # Create a lead
  Closeio::Lead.create(
    name: "Bluth Company",
    contacts: [{
      name: "Buster Bluth",
      emails: [{type: "office", email: "cartographer@bluthcompany.com"}]
    }]
  )

  # Saved Search (SmartView)
  saved_search = Closeio::SavedSearch.all.first
  saved_search.leads
````

### History

View the [changelog](https://github.com/taylorbrooks/closeio/blob/master/CHANGELOG.md)
This gem follows [Semantic Versioning](http://semver.org/)

### Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/taylorbrooks/closeio/issues)
- Fix bugs and [submit pull requests](https://github.com/taylorbrooks/closeio/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

### Copyright
Copyright (c) 2015 Taylor Brooks. See LICENSE for details.
