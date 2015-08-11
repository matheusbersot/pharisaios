class AgenciaMoeda < ActiveRecord::Base

  belongs_to :agencia
  belongs_to :moeda

end
