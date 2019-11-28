[![Gem Version](https://badge.fury.io/rb/cm_page_builder-rails.svg)](https://badge.fury.io/rb/cm_page_builder-rails)

# CmPageBuilder::Rails
This gem's purpose is to allow easy integration between the Commutatus react package cm-page-builder and any rails applications created by

## Usage
To activate this module, add `include CmPageBuilder::Rails::HasCmContent` on top of any model file that should have an associated rich text field.

## Installation


```ruby
gem 'react-rails', '~> 2.6.0'
gem 'cm_page_builder-rails'
```

And then execute:
```bash
$ bundle
```

Follow all react-rails installation instructions

Then run `rails cm_page_builder_rails:install:migrations`

In `config/routes.rb`, mount the endpoint with the line `mount CmPageBuilder::Rails::Engine => "/cm_page_builder"`

### Setting up CORS for aws
Do this or the direct upload capabilities won't work
https://keithpblog.org/post/active-storage-on-amazon-s3/

### Building the gem
`gem build cm_page_builder-rails.gemspec`
`gem push cm_page_builder-rails-0.1.x.gem`

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
