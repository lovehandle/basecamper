module Basecamper
  class Milestone < Resource

    parent_resources :project

    class << self
      def all(options)
        find(:all, {:from => :list}.merge(options))
      end
    end
  end
end
