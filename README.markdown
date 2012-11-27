## Welcome to use PL-Forms

It's a actually project using in Enterprise, purpose is simple, just building a customized rails scaffold which enable auto generate the forms.

## How to use it

* bundle install
* rake rails:template LOCATION=generate_forms.rb
* rake db:migrate

## Some important file notes

### generate_forms.rb

Customized rails template script

### forms_*.rb

All forms definition.

### lib/template/*

The master page template which used to generate forms latter.