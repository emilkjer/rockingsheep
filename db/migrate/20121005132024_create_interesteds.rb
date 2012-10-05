class CreateInteresteds < ActiveRecord::Migration
  def change
    create_table :interesteds do |t|
      t.string :email
      t.string :ip

      t.timestamps
    end
  end
end
