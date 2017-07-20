require "rails_taggable/version"
require 'rails_taggable/engine'

module RailsTaggable
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :models

    def initialize
      @models = []
    end
  end
end
