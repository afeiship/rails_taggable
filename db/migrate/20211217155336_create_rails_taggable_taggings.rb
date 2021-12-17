class CreateRailsTaggableTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_taggable_taggings do |t|
      t.references :tag, null: false, foreign_key: { to_table: :rails_taggable_tags }
      t.references :taggable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
