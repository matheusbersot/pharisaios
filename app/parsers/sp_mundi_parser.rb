class SPMundiParser < CambioParserInterface

  def self.obter_dados
    valores = {}
    pagina = Nokogiri::HTML(open('https://www.spmundi.com.br/moedas-em-especie'), nil, 'utf-8')
    pagina.css("a[class='product-box'] > div[class^='title']  ~ div[class='price ']").each do |node|

      nomeMoeda =  node.previous.previous.text.strip
      valorMoeda = node.child.text.strip
      valorMoeda = valorMoeda[2, valorMoeda.length]
      valorMoeda = valorMoeda.gsub(',','.')

      valores = adicionarValorMoeda(nomeMoeda, valorMoeda, valores)
    end
    valores
  end

end