class CreateUserRecentForms < ActiveRecord::Migration
  def change
    create_table :user_recent_forms do |t|
      t.references :user
      t.string :controller

      t.timestamps
    end
  end
end
