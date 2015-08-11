class CreateAgenciasMoeda < ActiveRecord::Migration
  def change
    create_table :agencias_moeda do |t|
      t.belongs_to :agencia, index: true
      t.belongs_to :moeda, index: true
      t.float :valor
      t.date :dtUltimaAtualizacao

      t.timestamps null: false
    end
  end
end
