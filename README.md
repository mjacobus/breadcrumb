# Breadcrumb

[![Build Status](https://travis-ci.org/mjacobus/breadcrumb.png?branch=master)](https://travis-ci.org/mjacobus/breadcrumb)
[![Coverage Status](https://coveralls.io/repos/mjacobus/breadcrumb/badge.png)](https://coveralls.io/r/mjacobus/breadcrumb)
[![Code Climate](https://codeclimate.com/github/mjacobus/breadcrumb.png)](https://codeclimate.com/github/mjacobus/breadcrumb)
[![Dependency Status](https://gemnasium.com/mjacobus/breadcrumb.png)](https://gemnasium.com/mjacobus/breadcrumb)
[![Gem Version](https://badge.fury.io/rb/breadcrumb.png)](http://badge.fury.io/rb/breadcrumb)

## Instalation
Put the following line in your Gemfile

```ruby
gem 'breadcrumb'
```

And then execute:

    $ bundle

## Usage

Layout:
  <%= breadcrumb %>

You can add a root path by doing this

  <%= breadcrumb.prepend("Home","/") %>

In your view (say the uri path is /books/religion/the-holly-bible):

```erb
  <%
  breadcrumb.add("Books","/books")
  breadcrumb.add("Religion", books_category_path(@book.category))
  breadcrumb.add(@book.title)
  %>
```

It will render

```html
  <div class="breadcrumb">
    <a href="/books">Books</a>
    <span class="separator"> » </span>
    <a href="/books/religion">Religion</a>
    <span class="separator"> » </span>
    <span>The Holly Bible</span>
  </div>
```

You can change the separator

```erb
<% breadcrumb.separator = '<span class="separator"> &gt; </span>' %>
```

Titleizing
You can use breadcrumb for creating the page title:

```erb
  <title><%= breadcrumb.titleize %></title>
```

which will ouput


```erb
  <title>Books :: Religion :: The Holly Bible</title>
```

Titleize accepts block. When using blocks, returning false removes the title part. Returing nil, won't change the behavior. Returning String changes the title part.

```erb
  <title><%= breadcrumb.titleize {|part| "Our Awesome Books" if parts == 'Books' } %></title>
```

Ouputs

```
  <title>Our Awesome Books :: Religion :: The Holly Bible</title>
```

Removing the title part

```
  <title><%= breadcrumb.titleize {|part| false if part == "Religion" } %></title>
<!-- or -->
  <title><%= breadcrumb.titleize {|part, order| false if order == 1 } %></title>
 ```

Outputs

```erb
  <title>Books :: The Holly Bible</title>
```

And you can change the title separator:

```erb
<% breadcrumb.title_separator = '-' %>
```

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
**Do not forget to write tests**
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

