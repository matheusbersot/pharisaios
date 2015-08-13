class SingraturParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    contador = 0

    pagina = Nokogiri::HTML(open('http://www.singratur.com.br/cambio/'))
    pagina.css("div[class='rep_cotacao_home']").each do |node|

      if contador < 3

        nomeMoeda =  node.child.next.text.strip

        if(nomeMoeda == "Dólar")
          nomeMoeda = "Dólar Americano"
        elsif (nomeMoeda == "Libra")
          nomeMoeda = "Libra Esterlina"
        end

        valorMoeda = node.child.next.next.next.next.next.child.next.next.text.strip
        valorMoeda = valorMoeda[2, valorMoeda.length]
        valorMoeda = valorMoeda.gsub(',','.')

        if Utils.valid_float?(valorMoeda)
          siglaMoeda = obterSiglaMoeda(nomeMoeda)
          if(siglaMoeda)
            valores[siglaMoeda] = valorMoeda.to_f
          end
        else
          #TODO: pensar no que fazer se a moeda não puder ser um número real (possivelmente um caso de erro)
        end
      end

      contador += 1

      #puts "#{nomeMoeda.strip} |  #{node.child.text.strip}"
    end
    valores
  end

end