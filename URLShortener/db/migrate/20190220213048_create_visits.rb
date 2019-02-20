class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.timestamps
      t.integer :user_id
      t.integer :url_id
    end
  end
end
