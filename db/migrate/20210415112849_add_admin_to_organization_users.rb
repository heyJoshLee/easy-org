class AddAdminToOrganizationUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :organization_users, :admin, :boolean, default: false
  end
end
