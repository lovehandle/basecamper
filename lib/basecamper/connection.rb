module Basecamper
  class Connection
    class << self

      attr_accessor :token, :use_ssl
      attr_writer :user, :password, :domain

      def user
        token.present? ? token : @user
      end

      def password
        token.present? ? 'X' : @password
      end

      def domain
        !!use_ssl ? "https://#{@domain}" : "http://#{@domain}"
      end

      def configure(&block)
        yield self
      end
    end
  end
end
