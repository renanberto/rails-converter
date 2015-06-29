class CreateConverts < ActiveRecord::Migration
  def change
    create_table :converts do |t|
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
