class AVSTurismoParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://www.avsturismo.com.br/?view=cambio'), nil, 'utf-8')
    pagina.css("table[class='table-moeda'] > tbody > tr").each do |node|

      nomeMoeda = node.child.next.next.next.child.text.strip

      if (nomeMoeda == "Dólar EUA")
        nomeMoeda = 'Dólar Americano'
      end

      valorMoeda = node.child.next.next.next.next.next.next.next.child.text.strip
      valorMoeda = valorMoeda[3, valorMoeda.length]
      valorMoeda = valorMoeda.gsub(',', '.')

      if (/RVTM/.match("#{nomeMoeda}") == nil)
        valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
      end
    end

    valores
  end

end