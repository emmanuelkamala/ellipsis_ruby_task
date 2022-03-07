class AddExpirationToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :expiration, :datetime
  end
end
