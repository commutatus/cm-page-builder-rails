[![Gem Version](https://badge.fury.io/rb/cm_page_builder-rails.svg)](https://badge.fury.io/rb/cm_page_builder-rails)

# CmPageBuilder::Rails
This gem's purpose is to allow easy integration between the Commutatus javascript library [cm-page-builder](https://github.com/commutatus/cm-page-builder) and any Rails application that requires storing and editing content through Rails-rendered webpages.

## Requirements

* Rails 6+
* Webpacker must be enabled in the project


## Initial setup:

* Add the following lines to the gemfile:
  ```ruby
  gem 'react-rails', '~> 2.6.0'
  gem 'cm_page_builder-rails'
  ```
  And then execute:
  ```bash
  $ bundle
  ```
* Follow all react-rails installation instructions (https://github.com/reactjs/react-rails)
*Important:* ensure that the `hello_world` example successfully works

* Add the javascript package with `yarn add cm-page-builder@1.2.69`

* Run `rails cm_page_builder_rails:install:migrations`

* In `config/routes.rb`, mount the endpoint with the line `mount CmPageBuilder::Rails::Engine => "/cm_page_builder"`

* Initialize the layout

## Usage
This package comes with a concern, `CmPageBuilder::Rails::HasCmContent` `include CmPageBuilder::Rails::HasCmContent`
To activate this module, add `include CmPageBuilder::Rails::HasCmContent` on top of any model file that should have an associated rich text field.

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
