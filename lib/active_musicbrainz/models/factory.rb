module ActiveMusicbrainz
  module Model
    class Factory
      def self.define &block
        factory = new
        factory.instance_eval &block if block_given?
        factory
      end

      def model table_name, &block
        klass = model_class table_name
        klass.class_eval &block if block_given?
        klass
      end

      private

      def camelize_table_name(term, uppercase_first_letter = true)
        string = term.to_s
        string = string.sub(/^[a-z\d]*/) { $&.capitalize }
        string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
      end

      def model_class table_name
        Model.const_get camelize_table_name(table_name)
      rescue NameError
        build_model_class table_name
      end

      def build_model_class table_name
        klass = Class.new ActiveRecord::Base do
          self.table_name = table_name
          self.inheritance_column = :_sti_type
          include Base
        end
        Model.const_set camelize_table_name(table_name), klass
      end
    end
  end
end
