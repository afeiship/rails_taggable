module RailsTaggable
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, :as => :taggable, class_name: 'RailsTaggable::Tagging'
      has_many :tags, :through => :taggings, class_name: 'RailsTaggable::Tag'
    end

    def tag_names
      tags.map(&:name)
    end
  end
end
