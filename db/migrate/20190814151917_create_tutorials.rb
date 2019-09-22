class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :name
      t.text :description
      t.datetime :creation_date

      t.timestamps
    end
  end
end
