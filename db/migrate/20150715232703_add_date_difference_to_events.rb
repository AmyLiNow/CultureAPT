class AddDateDifferenceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date_difference, :integer
  end
end
