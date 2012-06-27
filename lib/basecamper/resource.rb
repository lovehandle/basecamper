module Basecamper
  class Resource < ActiveResource::Base

    class << self

      protected
      alias :old_find :find
      public

      def find(*args)
        self.site = Basecamper::Connection.domain
        self.set_authentication

        old_find(*args)
      end

      def parent_resources(*parents)
        parents.each do |parent|

          define_method(parent) do
            resource = "Basecamper::#{parent.to_s.classify}".constantize

            parent_id_key = "#{resource.element_name}_id"
            id_value      = attributes[parent_id_key]

            resource.find(id_value) rescue nil
          end
        end
      end

      def child_resources(*children)
        children.each do |child|          
          define_method(child) do
            resource = "Basecamper::#{child.to_s.singularize.classify}".constantize

            parent_id_key   = "#{self.class.element_name}_id"
            resource.prefix = "/#{self.class.collection_name}/:#{parent_id_key}/"

            resource.all(:params => { parent_id_key => id }) rescue []
          end
        end
      end

      def all(*args)
        find(:all, *args)
      end

      def first(*args)
        find(:first, *args)
      end

      def last(*args)
        find(:last, *args)
      end

      def prefix_source
        '/'
      end

      protected

      def set_authentication
        if Basecamper::Connection.use_oauth
          self.headers['authorization'] = "Bearer '#{Basecamper::Connection.token}'"
        else
          self.user     = Basecamper::Connection.user
          self.password = Basecamper::Connection.password
        end
      end

    end

  end
end
