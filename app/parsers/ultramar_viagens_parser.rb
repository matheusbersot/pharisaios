class UltramarViagensParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('http://www.ultramarviagens.com.br/cambio'), nil, 'utf-8')
    pagina.css("table[class='tb'] > tbody > tr ~ tr").each do |node|

      nomeMoeda = node.child.next.child.next.text.strip

      if (nomeMoeda == "Dolar")
        nomeMoeda = 'Dólar Americano'
      elsif (nomeMoeda == "Libra")
        nomeMoeda = 'Libra Esterlina'
      end

      valorMoeda = node.child.next.next.next.next.next.child.text.strip
      valorMoeda = valorMoeda.gsub(',', '.')

      if (/VTM/.match("#{nomeMoeda}") == nil)
        valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
      end
    end

    valores
  end

end