module Basecamper
  class Milestone < Resource

    parent_resources :project

    class << self

      def collection_path(prefix_options = {}, query_options = nil)
        prefix_options, query_options = split_options(prefix_options) if query_options.nil?
        "#{prefix(prefix_options)}#{collection_name}/list.#{format.extension}#{query_string(query_options)}"
      end

    end
  end
end
