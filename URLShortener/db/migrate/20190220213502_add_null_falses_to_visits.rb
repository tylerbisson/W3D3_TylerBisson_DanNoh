class AddNullFalsesToVisits < ActiveRecord::Migration[5.2]
  def change
    change_column_null :visits, :user_id, false
    change_column_null :visits, :url_id, false
  end
end
