class CreateInteresteds < ActiveRecord::Migration
  def change
    create_table :interesteds do |t|
      t.text :desc
      t.string :ip
      t.string :email
      t.string :locale

      t.timestamps null: false
    end
  end
end
