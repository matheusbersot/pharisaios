class MaximaCambioParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://lojavirtual.maximacambio.com.br/lojamaxima/carga.aspx'))
    pagina.css("div[class='box_carga posicao'] > span > div[class^='img_titulo_carga posicao']  ~ div[class='linha_carga posicao']
      ~ div[class='linha_carga posicao'] ~ div[class='linha_carga posicao']").each do |node|

      nomeMoeda =  node.previous.previous.previous.previous.previous.previous.child.next.next.next.child.next.text
      valorMoeda = node.previous.previous.child.next.next.next.child.next.child.text
      valorMoeda = valorMoeda[3, valorMoeda.length]

      if (/CART/.match("#{nomeMoeda}") == nil)
        siglaMoeda = obterSiglaMoeda(nomeMoeda)
        if(siglaMoeda)
          valores[siglaMoeda] = valorMoeda
        end
      end

      #puts "#{nomeMoeda} |  #{valorMoeda}"

    end
    valores
  end

end