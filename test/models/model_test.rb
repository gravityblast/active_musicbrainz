require_relative '../test_helper'

module ActiveMusicbrainz
  describe Model do

    def model table_name, &block
      Model::Factory.define.model table_name, &block
    end

    after do
      Model.send :remove_const, 'Artist'
    end

    it 'creates model class' do
      klass = model 'artist'
      klass.superclass.must_equal(ActiveRecord::Base)
    end

    it 'sends &block to the created class' do
      klass = model 'artist' do
        def hello; end
      end
      klass.instance_methods.must_include :hello
    end

    it 'creates the new model inside the Model module' do
     klass = model 'artist'
     klass.name.must_equal 'ActiveMusicbrainz::Model::Artist'
    end

    it 'reopens class' do
      model 'artist' do
        def method_1; end
      end
      model 'artist' do
        def method_2; end
      end
      Model::Artist.instance_methods.must_include :method_1
      Model::Artist.instance_methods.must_include :method_2
    end
  end
end
