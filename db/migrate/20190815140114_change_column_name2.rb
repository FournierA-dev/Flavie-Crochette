class ChangeColumnName2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :sub_articles, :type, :sub_article_type
  end
end
