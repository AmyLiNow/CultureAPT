class AddTimeStringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :time_string, :string
  end
end
