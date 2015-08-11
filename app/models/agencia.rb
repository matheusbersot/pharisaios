class Agencia < ActiveRecord::Base

  has_many :agencia_moedas

  validates :nome, presence: true, uniqueness:true
  validates :url, presence: true
end
