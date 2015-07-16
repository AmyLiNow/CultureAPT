class AddOrgNumToOrgs < ActiveRecord::Migration
  def change
    add_column :orgs, :org_num, :integer
  end
end
