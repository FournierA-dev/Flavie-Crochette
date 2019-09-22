class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :content
      t.integer :tagable_id
      t.string :tagable_type
      t.timestamps
    end
    add_index :tags, [:tagable_id,:tagable_type]
  end
end

