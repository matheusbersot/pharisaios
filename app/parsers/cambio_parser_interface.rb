class CambioParserInterface

  @@moedas = Moeda.all

  def self.obter_dados
    raise "Isto não está implementado!"
  end

  def self.obterSiglaMoeda(nomeMoeda)
    siglaMoeda = nil
    @@moedas.each do |moeda|
      isMatched = /#{moeda.sigla}/.match(nomeMoeda)
      if isMatched
        siglaMoeda = moeda.sigla
      end
    end
    siglaMoeda
  end

end