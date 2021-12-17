module RailsTaggable
  class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy, class_name: 'RailsTaggable::Tagging'
    has_many :posts, through: :taggings, source: :taggable, source_type: 'Post'

    # RailsTaggable.configuration.models.each do |item|
    #   has_many item.underscore.downcase.pluralize.to_sym, through: :taggings, :source => :taggable, :source_type => item
    # end
  end
end
