require "basecamper/version"

# Basecamper Utilities
require "basecamper/connection"
require "basecamper/resource"

# Basecamp Resources
require "basecamper/resources/attachment"
require "basecamper/resources/category"
require "basecamper/resources/comment"
require "basecamper/resources/company"
require "basecamper/resources/message"
require "basecamper/resources/milestone"
require "basecamper/resources/person"
require "basecamper/resources/project"
require "basecamper/resources/time_entry"
require "basecamper/resources/todo_list"
require "basecamper/resources/todo_item"

module Basecamper
  class << self
    def account
      Resource.find(:one, :from => "/account.xml")
    end
  end
end
