class CreateRailsTaggableTags < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_taggable_tags do |t|
      t.string :name
      t.string :code

      t.timestamps
    end

    # 1. 唯一索引：确保 name 唯一（通常标签名不可重复）
    add_index :rails_taggable_tags, :name, unique: true
    
    # 2. 唯一索引：确保 code 唯一（如果 code 用于标识）
    add_index :rails_taggable_tags, :code, unique: true
    
    # 3. 组合索引：同时查询 name 和 code 时使用（可选）
    # add_index :rails_taggable_tags, [:name, :code], unique: true
    
    # 4. 如果 code 允许为 NULL，需特殊处理（见下方说明）
  end
end