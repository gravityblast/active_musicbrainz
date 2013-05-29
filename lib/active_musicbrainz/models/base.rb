module ActiveMusicbrainz
  module Model
    module Base
      def self.included base
        base.send :extend, ClassMethods
      end

      module ClassMethods
        def has_name association_name
          define_method :name do
            send(association_name).name
          end
        end

        def has_artist_credits
          belongs_to  :artist_credit, foreign_key: :artist_credit
          has_many    :artist_credit_names, through: :artist_credit
          has_many    :artists, through: :artist_credit_names
        end
      end
    end
  end
end
