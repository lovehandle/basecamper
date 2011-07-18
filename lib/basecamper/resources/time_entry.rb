module Basecamper
  class TimeEntry < Resource

    parent_resources :project, :todo_item

    class << self
      def report(options = {})
        find(:all, {:from => :report}.merge(options))
      end
    end
  end
end
