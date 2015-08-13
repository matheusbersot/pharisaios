class QuatroCantosCambioParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('http://www.4cantoscambio.com.br/PapelMoeda.aspx'), nil, 'utf-8')
    pagina.css("div[class='boxProduto']").each do |node|

      nomeMoeda = node.child.next.next.next.child.text.strip
      valorMoeda = node.child.next.next.next.next.next.child.next.child.next.next.next.child.text.strip
      valorMoeda = valorMoeda.gsub(',', '.')

      valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
    end
    valores
  end

end