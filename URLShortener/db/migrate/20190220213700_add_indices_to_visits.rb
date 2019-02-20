class AddIndicesToVisits < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, :user_id
    add_index :visits, :url_id
  end
end
