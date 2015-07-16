class AddEventPhoneToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_phone, :string
  end
end
