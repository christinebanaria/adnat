class Shifts < ActiveRecord::Migration[5.1]
  def create
    create_table :shifts do |t|
      t.user_id :integer, null => false
      t.start :datetime
      t.finish :datetime
      t.break_length :integer
    end
  end
end
