class TorreCambioParser < CambioParserInterface

  def self.obter_dados
    pagina = Nokogiri::HTML(open("http://www.torrecambio.com.br/"))

    valores = {}

    pagina.css("div[class='boxProduto'] > span[class='nomeProduto'] ~ div[class='espacoDetalhesProduto'] div[class='espacoPrecoProduto']
             span[class='precoProduto']").each do |node|

      nomeMoeda = node.parent.parent.previous.previous.text.strip
      valorMoeda = node.text.strip
      valorMoeda = valorMoeda.gsub(',','.')

      if Utils.valid_float?(valorMoeda)
        siglaMoeda = obterSiglaMoeda(nomeMoeda)
        if(siglaMoeda)
          valores[siglaMoeda] = valorMoeda.to_f
        end
      else
        #TODO: pensar no que fazer se a moeda não puder ser um número real (possivelmente um caso de erro)
      end
    end
    valores
  end
end