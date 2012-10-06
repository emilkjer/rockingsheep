class RenameEmailToEmailAddress < ActiveRecord::Migration
  def up
    rename_column :interesteds, :email, :email_address 
  end

  def down
    rename_column :interesteds, :email_address, :email
  end
end
