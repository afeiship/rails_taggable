class CreateRailsTaggableTags < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_taggable_tags do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
