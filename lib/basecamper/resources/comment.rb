module Basecamper
  class Comment < Resource

    parent_resources :message, :milestone, :todo_item

  end
end
