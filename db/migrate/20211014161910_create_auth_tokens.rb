class CreateAuthTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :auth_tokens do |t|
      t.string :token
      t.boolean :expired

      t.timestamps
    end
  end
end
