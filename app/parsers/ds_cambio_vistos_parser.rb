class DsCambioVistosParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('http://cambioevistos.com.br/cotacoes-diarias/'))
    pagina.css("table[id='table-cambio'] > tbody").each do |node|

      node.children.each do |noFilho|

         if(noFilho.name == 'tr')
           nomeMoeda =  noFilho.child.next.child.text.strip
           valorMoeda = noFilho.child.next.next.next.child.text.strip
           valorMoeda = valorMoeda[3, valorMoeda.length]

           if Utils.valid_float?(valorMoeda)
             siglaMoeda = obterSiglaMoeda(nomeMoeda)
             if(siglaMoeda)
               valores[siglaMoeda] = valorMoeda
             end
           else
             #TODO: pensar no que fazer se a moeda não puder ser um número real (possivelmente um caso de erro)
           end
         end
      end
    end
    valores
  end

end