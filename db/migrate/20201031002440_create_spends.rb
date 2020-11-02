class CreateSpends < ActiveRecord::Migration[6.0]
  def change
    create_table :spends do |t|
      t.references :congressman, foreign_key: true
      t.string :description
      t.string :provider
      t.integer :liquid_value
      t.date :document_emission_date
      t.string :document_url
      t.timestamps
    end
  end
end
