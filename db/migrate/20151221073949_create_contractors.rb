class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.references :user, index: true, foreign_key: true
      t.string :business_name
      t.text :description
      t.string :city

      t.timestamps null: false
    end
  end
end
