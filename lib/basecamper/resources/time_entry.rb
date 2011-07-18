module Basecamper
  class TimeEntry < Resource

    parent_resources :project, :todo_item

    class << self
      def remote(options = {})
        all(:from => :remote, :params => options)
      end
    end
  end
end
