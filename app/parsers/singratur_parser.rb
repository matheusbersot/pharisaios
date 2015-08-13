class SingraturParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    contador = 0

    pagina = Nokogiri::HTML(open('http://www.singratur.com.br/cambio/'), nil, 'utf-8')
    pagina.css("div[class='rep_cotacao_home']").each do |node|

      if contador < 3

        nomeMoeda = node.child.next.text.strip

        if (nomeMoeda == "Dólar")
          nomeMoeda = "Dólar Americano"
        elsif (nomeMoeda == "Libra")
          nomeMoeda = "Libra Esterlina"
        end

        valorMoeda = node.child.next.next.next.next.next.child.next.next.text.strip
        valorMoeda = valorMoeda[2, valorMoeda.length]
        valorMoeda = valorMoeda.gsub(',', '.')

        valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
      end
      contador += 1
    end
    valores
  end

end