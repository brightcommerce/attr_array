# AttrArray

A high performance ActiveRecord concern for Rails using the PostgreSQL array type.

## Installation

To install add the line to your Gemfile:

```ruby
gem 'attr_array'
```

And `bundle install`.

## Dependencies

AttrArray is developed as a ActiveRecord model concern, therefore it is dependent upon ActiveSupport. It is also developed only for use with PostgreSQL. It may work with other databases, but I haven't tried them.

## How To Use

To add AttrArray to a model, include the concern:

```ruby
class Post < ActiveRecord::Base
  include AttrArray

  attr_array :tags
end
```

To autoload AttrArray for all models, add the following to an initializer:

```ruby
require 'attr_array/active_record'
```

You then don't need to `include AttrArray` in any model.

### Scopes

```ruby
with_any_#{tag_name}
with_all_#{tag_name}
without_any_#{tag_name}
without_all_#{tag_name}
```

### Class methods

```ruby
all_#{tag_name}
{tag_name}_cloud
```

### Setup

Add the model attributes you want to use with AttrArray in your migration:

```ruby
class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |table|
      table.column :tags, :string, array: true, default: [], index: {using: 'gin'}
      table.column :authors, :string, array: true, default: [], index: {using: 'gin'}
      table.timestamps
    end
  end
end
```

You can nominate multiple attributes in the `attr_array` class method:

```ruby
class Post < ApplicationRecord
  include AttrArray

  attr_array :tags, :authors
end
```

### Usage

```ruby
@post.tags = ["awesome", "slick"]
@post.authors = ["Roald Dahl"]

Post.with_any_authors("Roald Dahl")
Post.without_any_tags("slick")
```

## Acknowledgements

This gem is based on code from [pg_tags](https://github.com/yosriady/pg_tags). Modified to use ActiveSupport::Concern and doesn't automatically hook into ActiveRecord.

This gem is maintained by [Jurgen Jocubeit](https://github.com/JurgenJocubeit).

## Copyright

Copyright 2017 Brightcommerce, Inc. All rights reserved.
