class AddEventNumToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_num, :integer
  end
end
