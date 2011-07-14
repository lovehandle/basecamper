module Basecamper
  class Message < Resource

    self.element_name = 'post'

    parent_resources :project

  end
end
