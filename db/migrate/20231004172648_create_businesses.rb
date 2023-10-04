class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :team
      t.integer :star_rating

      t.timestamps
    end
  end
end
