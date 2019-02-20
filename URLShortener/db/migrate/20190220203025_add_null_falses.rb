class AddNullFalses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :email, false
    change_column_null :shortened_urls, :long_url, false 
    change_column_null :shortened_urls, :short_url, false 
    change_column_null :shortened_urls, :user_id, false 
  end
end
