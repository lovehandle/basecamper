Basecamper
==========

[![travis](https://secure.travis-ci.org/rclosner/basecamper.png)](http://travis-ci.org/rclosner/basecamper)

Basecamper is a Ruby wrapper to the 37 Signals [Basecamp API](http://developer.37signals.com/basecamp)

Installation
------------

Simply add the gem to your Gemfile

```ruby
    gem 'basecamper'
```

Configuration
-----

Add authentication configurations:

```ruby
    Basecamper.configure do |config|
      config.token   = '123abc'
      config.domain  = 'dummy.basecamphq.com'
    end
```

Basecamper also enables one to authenticate with one's username and password:

```ruby
    Basecamper.configure do |config|
      config.user      = '123abc'
      config.password  = 'secret'
    end
```

Authentication using OAuth is also supported:

```ruby
    Basecamper.configure do |config|
      config.use_oauth  = true
      config.token      = 'abc123'
    end
```

Use SSL?
    
```ruby
    Basecamper.configure {|c| c.use_ssl = true }
```

Usage
-----


View account info:

```ruby
    Basecamper.account
```

Return current user:

```ruby
    Basecamper::Person.me
```

Basic operations:

```ruby
    Basecamper::Project.all
    returns:  [#<Basecamper::Project:0x266e458 @attributes={"company"=>..}>]

    Basecamper::Project.first
    returns:  #<Basecamper::Project:0x266e458 @attributes={"company"=>..}>
```

Advanced queries:
    
```ruby
    Basecamper::TodoList.all(:params => { :project_id => 1234 })
    Basecamper::TodoList.find(:all, :params => { :project_id => 1234, :responsible_party => 9124 })
```

Child assocations:

```ruby
    project = Basecamper::Project.find(123)
    project.messages
```

Parent associations:

```ruby
    message = Basecamper::Message.find(123)
    message.project
```
