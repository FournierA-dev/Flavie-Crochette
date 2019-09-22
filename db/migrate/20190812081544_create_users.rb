class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :alias
      t.address :address #use of gem 'jt-rails-address'
      t.integer :age
    end
  end
end
