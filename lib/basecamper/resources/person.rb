module Basecamper
  class Person < Resource

    parent_resources :project, :company

  end
end
