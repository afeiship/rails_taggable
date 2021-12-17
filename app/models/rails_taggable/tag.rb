module RailsTaggable
  class Tag < ApplicationRecord
    # filters
    before_save :set_defaults

    # relationship
    has_many :taggings, dependent: :destroy, class_name: 'RailsTaggable::Tagging'
    RailsTaggable.models.each do |item|
      has_many item.underscore.downcase.pluralize.to_sym, through: :taggings, :source => :taggable, :source_type => item
    end

    # private
    private def set_defaults
      self.code ||= loop do
        random_code = SecureRandom.hex(10).slice(0, 6)
        break random_code unless self.class.exists?(code: random_code)
      end
    end
  end
end
