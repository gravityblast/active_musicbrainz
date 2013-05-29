require 'yaml'

module ActiveMusicbrainz
  class Config
    class << self
      def load config_path
        self.config = YAML.load_file config_path
      end

      def config= config
        @config = config
      end

      def database
        @config[:database]
      end
    end
  end
end
