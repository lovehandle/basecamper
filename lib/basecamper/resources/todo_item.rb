module Basecamper
  class TodoItem < Resource

    parent_resources :todo_list
    child_resources  :time_entries

  end
end
