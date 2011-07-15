module Basecamper
  class Project < Resource

    child_resources :attachments, :categories, :companies, :messages, :milestones, :people, :time_entries, :todo_lists

    class << self
      def count
        if response = find(:one, :from => :count)
          response.attributes
        end
      end
    end
  end
end
