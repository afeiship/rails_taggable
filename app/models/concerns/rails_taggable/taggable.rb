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
      # https://chat.qwen.ai/c/f2a950c8-dafc-4e1a-bf4d-10a57df31a05
      # 直接生成 SQL 查询，只从数据库取 name 字段，比原来的 tags.map(&:name) 快很多
      tags.pluck(:name)
    end
  end
end
