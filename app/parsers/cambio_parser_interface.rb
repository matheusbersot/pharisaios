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

  def self.adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
    if Utils.valid_float?(valorMoeda)
      siglaMoeda = obterSiglaMoeda(nomeMoeda)
      if(siglaMoeda)
        valores[siglaMoeda] = valorMoeda.to_f
      end
    else
      puts "Erro: #{self.class} - Não foi possível obter valor da moeda #{nomeMoeda}"
      #TODO: pensar no que fazer se a moeda não puder ser um número real (possivelmente um caso de erro)
    end
    valores
  end
end