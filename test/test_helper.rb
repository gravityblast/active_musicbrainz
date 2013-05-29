$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'minitest/autorun'
require 'rubygems'
require 'active_record'
require 'active_musicbrainz'
require 'yaml'

config = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))


ActiveRecord::Base.establish_connection config['test']
ActiveMusicbrainz.init

