### A Ruby wrapper for the Close.IO API

Learn about the Closeio API at http://developer.close.io.

I :heart: Close.io, so if you have problems using the gem or would like to see support for new endpoints, please open a GitHub issue -- I'll get it resolved as quick as I can.

Fwiw, I also run [DripEmails.com](https://www.DripEmails.com) -- a service for building automated email sequences using Close.io

### Installation
Add this line to your application's Gemfile:
````ruby
  # in your Gemfile
  gem 'closeio', '~> 2.4'

  # then...
  bundle install
````

### Usage
````ruby
  client = Closeio::Client.new("api key")

  # Find a specific lead
  client.find_lead('lead_xxxxxxxxxxxx')

  # See some data about the lead
  lead.data.addresses
  lead.data.contacts
  lead.data.opportunities

  # Update the lead
  client.update_lead(lead.id,
    name: "Bluth Company",
    addresses: [{
      "address_1": "747 Howard St",
      "city": "San Francisco"
    }]
  )

  # Delete the lead
  client.delete_lead(lead.id)

  # Merge two leads into one
  client.merge_leads(source_lead.id, destination_lead.id)

  # Find leads that match field
  client.list_leads(name: "Wayne Enterprises")

  # Find leads that match custom field
  client.list_leads('"custom.Favorite Color":"cornflower blue"')

  # Use paginate: true to fetch all the leads
  client.list_leads(name: "Wayne Enterprises", paginate: true)

  # Create a lead
  client.create_lead(
    name: "Bluth Company",
    contacts: [{
      name: "Buster Bluth",
      emails: [{type: "office", email: "cartographer@bluthcompany.com"}]
    }]
  )

  # Create a bulk edit job for leads filtered by a custom field
  client.bulk_edit(
    query: '"custom.International Database ID":12345',
    type: 'set_custom_field',
    custom_field_name: 'Local Database ID',
    custom_field_value: '123'
  )

  # Saved Search (SmartView)
  smart_view = client.list_smart_views
  smart_views.leads
````

### Options

You can disable the logger by passing in a second argument when creating a new client:
```ruby
  client = Closeio::Client.new("api key", false)
```

Some servers running on SSL need [specific configurations](https://github.com/lostisland/faraday/wiki/Setting-up-SSL-certificates) for the Faraday dependency.
If you're running on Heroku with SSL enabled, you need to pass in the path of the CA certificate when creating a new client:
```ruby
  client = Closeio::Client.new("api key", true, '/usr/lib/ssl/certs/ca-certificates.crt')
```

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
Copyright (c) 2016 Taylor Brooks. See LICENSE for details.
