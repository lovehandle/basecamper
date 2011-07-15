module Basecamper
  class Message < Resource

    self.element_name = 'post'

    parent_resources :project

    class << self
      def archived(options = {})
        find(:all, {:from => :archive}.merge(options))
      end
    end
  end
end
