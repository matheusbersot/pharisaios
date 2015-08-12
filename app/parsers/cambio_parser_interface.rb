class CambioParserInterface

  @@moedas = Moeda.all

  def self.obter_dados
    raise "Isto não está implementado!"
  end

  def self.obterSiglaMoeda(nomeMoeda)
    siglaMoeda = nil
    @@moedas.each do |moeda|
      matchSigla =  /#{moeda.sigla}/.match(nomeMoeda)
      matchNome  =  if nomeMoeda.downcase.index(moeda.nome.downcase)
                      true
                    else
                      false
                    end

      if matchSigla || matchNome
        siglaMoeda = moeda.sigla
      end
    end

    if !siglaMoeda
      nomeMoedaTmp = nomeMoeda.downcase
      if nomeMoedaTmp.index("americano")
        siglaMoeda = "USD"
      elsif nomeMoedaTmp.index("canadense")
        siglaMoeda = "CAD"
      elsif nomeMoedaTmp.index("iene")
        siglaMoeda = "JPY"
      elsif nomeMoedaTmp.index("franco")
        siglaMoeda = "CHF"
      elsif nomeMoedaTmp.index("yuan")
        siglaMoeda = "CNY"
      elsif nomeMoedaTmp.index("neozelan")
        siglaMoeda = "NZD"
      end
    end

    siglaMoeda
  end
end