class CreateOpportunities < ActiveRecord::Migration[8.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :description
      t.float :salary
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
