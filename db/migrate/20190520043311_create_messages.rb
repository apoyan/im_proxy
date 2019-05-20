class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :user_id
      t.string :messenger
      t.datetime :delivery_at

      t.timestamps
    end

    add_index :messages, [:user_id, :messenger, :body], unique: true
  end
end
