class ChangeStringTypeInArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :type, :text
  end
end
