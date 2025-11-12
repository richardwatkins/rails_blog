class CreateActsAsTaggableTables < ActiveRecord::Migration[7.1]
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :taggable, polymorphic: true, index: true
      t.references :tagger, polymorphic: true, index: true
      t.string :context, limit: 128
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
