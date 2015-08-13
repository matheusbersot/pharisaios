class CreateAgenciasMoeda < ActiveRecord::Migration
  def change
    create_table :agencias_moeda do |t|
      t.belongs_to :agencia, index: true
      t.belongs_to :moeda, index: true
      t.float :valor
      t.integer :diffUltimaAtualizacao #em segundos

      t.timestamps null: false
    end
  end
end
