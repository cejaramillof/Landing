class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :ip
      t.string :email
      t.string :locale

      t.timestamps null: false
    end
  end
end
