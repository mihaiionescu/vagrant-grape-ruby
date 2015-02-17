class CreateAccessTokensTable < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.text :token
      t.date :expires_at

      t.timestamps
    end
  end
end