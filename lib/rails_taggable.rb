require "rails_taggable/engine"

module RailsTaggable
  self.mattr_accessor :models
  self.models = []
  # add default values of more config vars here

  # this function maps the vars from your app into your engine
  def self.setup(&block)
    yield self
  end
end
