class AddDateStringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date_string, :string
  end
end
