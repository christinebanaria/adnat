class Organisations < ActiveRecord::Migration[5.1]
  def create
    create_table :organisations do |t|
      t.column :name, :string, :limit => 50, :null => false
      t.column :hourly_rate, :float, :null => false 
    end
  end
end
