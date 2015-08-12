class TorreCambioParser < CambioParserInterface

  def self.obter_dados
    pagina = Nokogiri::HTML(open("http://www.torrecambio.com.br/"))

    valores = {}

    pagina.css("div[class='boxProduto'] > span[class='nomeProduto'] ~ div[class='espacoDetalhesProduto'] div[class='espacoPrecoProduto']
             span[class='precoProduto']").each do |node|

      nomeMoeda = node.parent.parent.previous.previous.text
      valorMoeda = node.text.strip

      siglaMoeda = obterSiglaMoeda(nomeMoeda)
      if(siglaMoeda)
        valores[siglaMoeda] = valorMoeda
      end

      #puts "#{nomeMoeda.strip} |  #{node.text.strip}"

    end
    valores
  end
end