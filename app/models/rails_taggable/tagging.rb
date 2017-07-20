require 'rails'

module RailsTaggable
  class Tagging < ActiveRecord::Base
    belongs_to :tag
    belongs_to :taggable, :polymorphic => true, optional: true
  end
end
