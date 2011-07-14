Basecamper
==========

Basecamper is a Ruby wrapper to the 37 Signals [Basecamp API](http://developer.37signals.com/basecamp)

Installation
------------

Simply add the gem to your Gemfile

    gem 'basecamper'


Configuration
-----

Add authentication configurations:

    Basecamper.configure do |config|
      config.token   = '123abc'
      config.domain  = 'dummy.basecamphq.com'
    end

Basecamper also enables one to authenticate with one's username and password:

    Basecamper.configure do |config|
      config.user      = '123abc'
      config.password  = 'dummy.basecamphq.com'
    end

Use SSL?

    Basecamper.configure {|c| c.use_ssl = true }


Usage
-----


View your account info:

    Basecamper.account

Return the current user:

    Basecamper::Person.me

Returns resource index:

    Basecamper::Project.all
    returns:  [#<Basecamper::Project:0x266e458 @attributes={"company"=>..}>]

Utilize has_many assocations:

    project  = Basecamper::Project.find(:first)
    messages = project.messages

Utilize belongs_to associations:

    message = messages.first
    message.project
   
Add query params.

    Basecamper::TodoList.all(:params => { :project_id => 1234 })
    Basecamper::TodoList.find(:all, :params => { :project_id => 1234, :responsible_party => 9124 })
