class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :auth0_id
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :users, [ :auth0_id, :email ], unique: true
  end
end
