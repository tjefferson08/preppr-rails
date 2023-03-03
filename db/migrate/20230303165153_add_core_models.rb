class AddCoreModels < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false, index: {unique: true}

      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
