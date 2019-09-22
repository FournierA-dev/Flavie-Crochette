class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :type
      t.text :short_description
      t.text :description
      t.datetime :creation_date
      t.decimal :price,:scale => 1, :precision => 6
      t.timestamps
    end
  end
end
