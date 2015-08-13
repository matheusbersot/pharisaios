class TorreCambioParser < CambioParserInterface

  def self.obter_dados
    pagina = Nokogiri::HTML(open("http://www.torrecambio.com.br/"), nil, 'utf-8')

    valores = {}

    pagina.css("div[class='boxProduto'] > span[class='nomeProduto'] ~ div[class='espacoDetalhesProduto'] div[class='espacoPrecoProduto']
             span[class='precoProduto']").each do |node|

      nomeMoeda = node.parent.parent.previous.previous.text.strip
      valorMoeda = node.text.strip
      valorMoeda = valorMoeda.gsub(',','.')

      valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
    end
    valores
  end
end