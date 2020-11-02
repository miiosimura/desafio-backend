class CreateCongressmen < ActiveRecord::Migration[6.0]
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :cpf
      t.integer :external_id
      t.string :uf
      t.string :political_party
      t.timestamps
    end
  end
end
