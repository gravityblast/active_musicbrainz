# ActiveMusicbrainz

ActiveRecord models for the [MusicBrainz](http://musicbrainz.org/) [database](http://musicbrainz.org/doc/MusicBrainz_Database).

## Installation

Add this line to your application's Gemfile:

    gem 'active_musicbrainz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_musicbrainz

## Usage

Require ActiveMusicbrainz and initialize the database (**if you are inside a rails app, you can skip the following lines**):

    require 'active_musicbrainz'
    ActiveRecord::Base.establish_connection(YAML.load_file('path/to/config.yml'))

Some models are hardcoded, others are dynamically generated based on existing tables. You can initialize all those models with the following line:

    ActiveMusicbrainz.init

The *init* method should be called after establishing a database connection since the library needs to read all the database tables.
If you are inside a rails project you could put the code above in **config/initializers/active_musicbrainz.rb**.



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
