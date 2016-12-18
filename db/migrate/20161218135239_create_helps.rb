class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :email
      t.string :ip
      t.string :locale
      t.boolean :helped, :default => false
      t.text :desc

      t.timestamps null: false
    end
  end
end
