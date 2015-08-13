class SPMundiParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://www.spmundi.com.br/moedas-em-especie'))
    pagina.css("a[class='product-box'] > div[class^='title']  ~ div[class='price ']").each do |node|

      nomeMoeda =  node.previous.previous.text.strip
      valorMoeda = node.child.text.strip
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


      #puts "#{nomeMoeda.strip} |  #{node.child.text.strip}"
    end
    valores
  end

end