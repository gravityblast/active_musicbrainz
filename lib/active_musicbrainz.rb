require 'active_musicbrainz/version'
require 'active_musicbrainz/config'
require 'active_musicbrainz/models/base'
require 'active_musicbrainz/models/factory'
require 'active_musicbrainz/models/model'

module ActiveMusicbrainz
  def self.init
    Model.build_models
  end
end

