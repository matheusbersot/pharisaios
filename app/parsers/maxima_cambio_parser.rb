class MaximaCambioParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://lojavirtual.maximacambio.com.br/lojamaxima/carga.aspx'), nil, 'utf-8')
    pagina.css("div[class='box_carga posicao'] > span > div[class^='img_titulo_carga posicao']  ~ div[class='linha_carga posicao']
      ~ div[class='linha_carga posicao'] ~ div[class='linha_carga posicao']").each do |node|

      nomeMoeda = node.previous.previous.previous.previous.previous.previous.child.next.next.next.child.next.text.strip
      valorMoeda = node.previous.previous.child.next.next.next.child.next.child.text.strip
      valorMoeda = valorMoeda[3, valorMoeda.length]
      valorMoeda = valorMoeda.gsub(',', '.')

      if (/CART/.match("#{nomeMoeda}") == nil)
        valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
      end
    end
    valores
  end

end