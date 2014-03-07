class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :login_count, default: 0
      t.string :last_sign_in_ip
      t.string :current_sign_in_ip
      t.datetime :last_sign_in_at
      t.datetime :current_sign_in_at
      t.integer :failed_attempts, default: 0

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
