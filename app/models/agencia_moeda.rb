class AgenciaMoeda < ActiveRecord::Base

  belongs_to :agencia
  belongs_to :moeda

  validates :valor, presence: true;
  validates :diffUltimaAtualizacao, presence: true;

end
