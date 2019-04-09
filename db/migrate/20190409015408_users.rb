class Users < ActiveRecord::Migration[5.1]
  def create
    create_table :users do |t|
      t.column :organisation_id, :integer
      t.column :name, :string, :limit => 50, :null => false
      t.column :email_address, :string, :limit => 100, :null => false
      t.column :password_digest, :string, limit => 100
    end
  end
end
