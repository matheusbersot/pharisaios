class DsCambioVistosParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('http://cambioevistos.com.br/cotacoes-diarias/'), nil, 'utf-8')
    pagina.css("table[id='table-cambio'] > tbody").each do |node|

      node.children.each do |noFilho|

         if(noFilho.name == 'tr')
           nomeMoeda =  noFilho.child.next.child.text.strip
           valorMoeda = noFilho.child.next.next.next.child.text.strip
           valorMoeda = valorMoeda[3, valorMoeda.length]

           valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)

         end
      end
    end
    valores
  end

end