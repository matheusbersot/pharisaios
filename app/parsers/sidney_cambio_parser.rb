class SidneyCambioParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    contador = 0
    pagina = Nokogiri::HTML(open('http://www.sidney.com.br/cambio/cambio.aspx'), nil, 'utf-8')
    pagina.css("table[class='style1'] > tr").each do |node|

      if(contador>=5) && (contador <= 14)

        nomeMoeda = node.child.next.child.next.next.text.strip
        nomeMoeda = nomeMoeda[2, nomeMoeda.length]

        if (nomeMoeda == "Dólar")
          nomeMoeda = 'Dólar Americano'
        elsif (nomeMoeda == "Libra")
          nomeMoeda = 'Libra Esterlina'
        end

        valorMoeda = node.child.next.next.next.next.next.child.next.child.next.child.next.child.text.strip
        valorMoeda = valorMoeda[3, valorMoeda.length]
        valorMoeda = valorMoeda.gsub(',', '.')

        if (/RVTM/.match("#{nomeMoeda}") == nil && /RCTM/.match("#{nomeMoeda}") == nil)
          valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
        end
      end
      contador +=1
    end

    valores
  end

end