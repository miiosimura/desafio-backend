class CreateYearlySpends < ActiveRecord::Migration[6.0]
  def change
    create_table :yearly_spends do |t|
      t.references :congressman, foreign_key: true
      t.integer :year
      t.integer :total_spend
      t.timestamps
    end
  end
end
