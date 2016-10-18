# CMS9 - Demo

This is a demo application that uses Cms9 (Small CMS Admin module for Rails).

##What is a CMS9-demo
This is a small app made in the Ruby on Rails framework which uses the CMS9 library for Rails. For more information please see the  CMS9 documentation on the link: https://github.com/klikaba/cms9/tree/develop.

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
Where [DEF_ROUTE] is optional and represents where your Cms9 route will be mounted, by default it's /cms9

Install generator will mount Cms9 route, add current_user configurator initializer and additional configuration for Ckeditor.

Then run:

```bash
$ rails db:migrate
```

Restart your server, and visit http://localhost:3000/cms9 (or where you have defined Cms9 to be mounted)
to see your new Cms9 dashboard in action.

##Bootstrap and Material Design theme

To enhance the appearance we have added bootstrap for rails and Material Design theme.
To add bootstrap to the app please do the following steps:

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
To add the theme in app please follow next steps:

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
#application.scss
/*
*= require bootstrap-material-design
*/
```

##CMS9 admin panel

When your Cms9 is up and running, before creating posts and populating them with content we need to create a Post Types. Post Types is defined by fields and its types.

After creating a Post Type, you are ready to populate/create it's data. For different field types you will get different input methods, for easier input handling. Once when it's stored, it's available to be shown in your application.

In order to show all posts of one post type on our website, please do the following steps:

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
  if params[:name].blank?
  	@posts = Cms9::Post.all.limit(20).order('created_at desc')
  else
    post_definition = Cms9::PostDefinition.where(name: params[:name]).first
    @posts = post_definition.posts
  end
end
```

*To display all Posts in our index page we need to create it in the view/posts index.html.erb and add code:

```html
#view/posts/index.html.erb
<div class="row">
  <% @posts.each do |post| %>
    <div class="col-md-4">
      <div class="well">
        <%= link_to post.field('Title'), post_path(post.id) %>
       </div>
    </div>
  <% end %>
</div>
```
We are accesing to posts fields with this part of code:

```html
post.field('Title')
```
To create a Post type in the CMS9 admin panel we have to define the fields and types. For each field we must create a name, so we can access it in the app with this part of the code "post.field('Title')". For example, if we have created a post type with a field(text-area) under the name of "Description" we would access the value of this filed with the following code "post.field('Description')"

Before running the server, make sure that you have created some Post Types and populate/create it's data.

*Now we need to create access for each post. To do this we need to create method show in Posts controller.

```ruby
def show
  @post = Cms9::Post.find(params[:id])
end
```
*To display each populated post we need to create file in view/posts show.html.erb and add a code for displaying elements we want to display, as we have done in the index page or you can use next part of the code to show all fields types and values from all Post Types.

```html
<div class="row">
  <div class="col-md-12">
    <table class="table">
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>TYPE</th>
        <th>DATA</th>
      </tr>
    <% @post.fields.each do |field| %> 
      <tr>
        <td><%=field.id%></td>
        <td><%=field.post_field.name%></td>
        <td><%=field.post_field.field_type%></td>
        <td><%=cms9_field(field)%></td>
      </tr>
    <% end %>
    </table>
  </div>
</div>
```

Rerun the server and check for changes.

Now we have created index and show page, we are going to create header and footer for our app.
In the view/layouts crete partial views _header.html.erb and _footer.html.erb.

For header we have useed navigation bar from our material theme we have added.

```html
<div class="navbar navbar-info">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-material-light-blue-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <%= link_to 'CMS9',root_path, class:'navbar-brand' %>
    </div>
    <div class="navbar-collapse collapse navbar-material-light-blue-collapse">
      <ul class="nav navbar-nav">
        <% Cms9::PostDefinition.all.each do |post_def| %> 
          <% if post_def.posts.any? %>
            <li><%= link_to post_def.name , posts_path({name: post_def.name}) %></li>
          <% end %>
        <% end %>
      </ul>
    </div>
  </div>
</div>
```
You can choose another design for your navigation bar but make sure to use this part of code to display list of available Post Types in our CMS9 admin panel which have at least one populated post.

```ruby
<% Cms9::PostDefinition.all.each do |post_def| %> 
  <% if post_def.posts.any? %>
    <li><%= link_to post_def.name , posts_path({name: post_def.name}) %></li>
  <% end %>
<% end %>
```

*After finishing the navigation bar, add a partial view in your app.

```html
<body>
  <%= render 'layouts/header' %>
    <div class="container">
      <%= yield %>
    </div>
    <%= render 'layouts/footer' %>
</body>
```

You can make any kind of layout for your posts and show them however you want.
Once you made a simple layout, you are ready to create as many posts as you want. It's that easy.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


