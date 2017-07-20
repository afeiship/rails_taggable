require 'rails'

module RailsTaggable
  class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy, class_name: 'RailsTaggable::Tagging'
    # has_many :articles, through: :taggings, :source => :taggable, :source_type => 'Article'

    puts 'start....'
    puts RailsTaggable.configuration.models
    puts 'end....'
    RailsTaggable.configuration.models.each do |item|
      has_many item.underscore.downcase.pluralize.to_sym, through: :taggings, :source => :taggable, :source_type => item
    end
  end
end
