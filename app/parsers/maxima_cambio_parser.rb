class MaximaCambioParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://lojavirtual.maximacambio.com.br/lojamaxima/carga.aspx'))
    pagina.css("div[class='box_carga posicao'] > span > div[class^='img_titulo_carga posicao']  ~ div[class='linha_carga posicao']
      ~ div[class='linha_carga posicao'] ~ div[class='linha_carga posicao']").each do |node|

      nomeMoeda =  node.previous.previous.previous.previous.previous.previous.child.next.next.next.child.next.text.strip
      valorMoeda = node.previous.previous.child.next.next.next.child.next.child.text.strip
      valorMoeda = valorMoeda[3, valorMoeda.length]
      valorMoeda = valorMoeda.gsub(',','.')

      if (/CART/.match("#{nomeMoeda}") == nil)

        if Utils.valid_float?(valorMoeda)
          siglaMoeda = obterSiglaMoeda(nomeMoeda)
          if(siglaMoeda)
            valores[siglaMoeda] = valorMoeda.to_f
          end
        else
          #TODO: pensar no que fazer se a moeda não puder ser um número real (possivelmente um caso de erro)
        end


      end

      #puts "#{nomeMoeda} |  #{valorMoeda}"

    end
    valores
  end

end