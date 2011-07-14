module Basecamper
  class TodoList < Resource

    parent_resources  :project
    child_resources   :todo_items

  end
end
