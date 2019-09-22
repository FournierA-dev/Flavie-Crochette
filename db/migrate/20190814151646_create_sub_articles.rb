class CreateSubArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_articles do |t|
      t.string :type
      t.datetime :creation_date
      t.decimal :price,:scale => 1, :precision => 6
      t.belongs_to :article, index: true
      t.timestamps
    end
  end
end
