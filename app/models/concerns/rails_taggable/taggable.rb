module RailsTaggable
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, :as => :taggable, class_name: 'RailsTaggable::Tagging'
      has_many :tags, :through => :taggings, class_name: 'RailsTaggable::Tag'
    end

    def tag_list
      tags.map(&:name).join(', ')
    end
  end
end
