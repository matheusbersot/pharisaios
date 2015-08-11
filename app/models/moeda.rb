class Moeda < ActiveRecord::Base

  has_many :agencia_moedas

  validates :nome, presence: true, uniqueness:true
  validates :sigla, presence: true, length: { is: 3 }, format: { with: /\A[a-zA-Z]+\z/, message: "somente permite letras" }

end
