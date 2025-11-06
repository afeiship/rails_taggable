module RailsTaggable
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, :as => :taggable, class_name: 'RailsTaggable::Tagging'
      has_many :tags, :through => :taggings, class_name: 'RailsTaggable::Tag'
    end

    # 可选：提供便捷方法
    def tag_names=(names)
      names = Array(names).map(&:strip).reject(&:empty?).uniq
      self.tags = names.map { |name| Tag.find_or_create_by!(name: name) }
    end

    def tag_names
      tags.pluck(:name)
    end
  end
end
