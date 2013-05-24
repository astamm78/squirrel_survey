class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id, :survey_id
      t.timestamps
    end
  end
end
