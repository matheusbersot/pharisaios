class CreateMoedas < ActiveRecord::Migration
  def change
    create_table :moedas do |t|
      t.string :nome
      t.string :sigla

      t.timestamps null: false
    end
  end
end
