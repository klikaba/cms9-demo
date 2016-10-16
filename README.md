# CMS9 - Demo

This is a demo application for Cms9 - Small CMS Admin module for Rails.

##What is a CMS9-demo
This is a small app in the Ruby on Rails framework which uses the CMS9 library for Rails. For more information please see the  CMS9 documentation on the link https://github.com/klikaba/cms9/tree/develop.

## Getting Started

Add Cms9 to your Gemfile:

```ruby
# Gemfile
gem "cms9"
```

Re-bundle, then run the installer:

```bash
$ rails generate cms9:install [DEF_ROUTE]
```
Where [DEF_ROUTE] is optional and presents where your Cms9 route will be mounted, by default it's /cms9

Install generator will mount Cms9 route, add current_user configurator initializer and additional configuration for Ckeditor.

Then run:

```bash
$ rails db:migrate
```

Restart your server, and visit http://localhost:3000/cms9 (or where you defined Cms9 to be mounted)
to see your new Cms9 dashboard in action.

##Bootstrap and Material Design theme

To enhance the appearance we have added bootstrap for rails and Material Design.
To add bootstrap in app please follow next steps:

*In your Gemfile you need to add the bootstrap-sass gem, and ensure that the sass-rails gem is present - it is added to new Rails applications by default. 


```ruby
# Gemfile
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
```
Re-bundle and restart your server to make the files available through the pipeline.

*Import Bootstrap styles in app/assets/stylesheets/application.scss:

```ruby
// "bootstrap-sprockets" must be imported before "bootstrap" and "bootstrap/variables"
@import "bootstrap-sprockets";
@import "bootstrap";
```

*Change the extension of the application.css in scss.

```bash
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```
*Then, remove all the *= require_self and *= require_tree . statements from the sass file. Instead, use @import to import Sass files.

Require Bootstrap Javascripts in app/assets/javascripts/application.js:

```ruby
//= require jquery
//= require bootstrap-sprockets
```
bootstrap-sprockets and bootstrap should not both be included in application.js.

##Material Design

Material Design for Bootstrap is a Bootstrap V3 compatible theme. 
To add theme in app please follow next steps:

*In your Gemfile you need to add the material-design gem

```ruby
# Gemfile
gem 'bootstrap-material-design'
```
Re-bundle and restart your server to make the files available through the pipeline.

*You should include the theme right after the Bootstrap CSS and include the javascript at the end of your document, everything will be converted to Material Design (paper) style.

```ruby
#application.js:
//= require bootstrap-material-design
application.css:
```

```ruby
#*application.scss
/*
*= require bootstrap-material-design
*/
```


##CMS9 admin panel

When your Cms9 is up and running, before creating posts and populating them with content we need to create a Post Types. Post Types is defined by fields and its types.

After creating a Post Type, you are ready to populate/create it's data. For different field types you will get different input methods, for easier input handling. Once when it's stored, it's available to be showed in your application.

In order to show on our website all posts of one post type, please follow the following steps:

*Generate controller Posts

```bash
$ rails g controller Posts
```
*Add routes in routes file:

```ruby
#config/routs
root 'posts#index'
resources :posts, only: [:index, :sho
```

*In the Posts controller create method for the index page.

```ruby
def index
end
```






Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

