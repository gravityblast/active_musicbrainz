module ActiveMusicbrainz
  module Model
    class Base < ActiveRecord::Base
      self.abstract_class = true

      def self.has_artist_credits
        belongs_to  :artist_credit, foreign_key: :artist_credit
        has_many    :artist_credit_names, through: :artist_credit
        has_many    :artists, through: :artist_credit_names
      end

      def self.has_gid
        define_singleton_method :by_gid do |gid|
          find_by gid: gid
        end
      end
    end
  end
end
