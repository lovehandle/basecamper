module Basecamper
  class Project < Resource

    child_resources :attachments, :categories, :companies, :messages, :milestones, :people, :time_entries, :todo_lists

  end
end
