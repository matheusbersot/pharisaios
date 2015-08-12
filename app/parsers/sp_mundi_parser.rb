class SPMundiParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://www.spmundi.com.br/moedas-em-especie'))
    pagina.css("a[class='product-box'] > div[class^='title']  ~ div[class='price ']").each do |node|
      nomeMoeda =  node.previous.previous.text

      valorMoeda = node.child.text.strip
      valorMoeda = valorMoeda[2, valorMoeda.length]


      siglaMoeda = obterSiglaMoeda(nomeMoeda)
      if(siglaMoeda)
        valores[siglaMoeda] = valorMoeda
      end

      #puts "#{nomeMoeda.strip} |  #{node.child.text.strip}"
    end
    valores
  end

end