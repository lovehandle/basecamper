module Basecamper
  class Person < Resource

    parent_resources :project, :company


    class << self
      def me
        find(:one, :from => '/me.xml')
      end
    end
  end
end
