# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Moeda.create([{nome: 'Dólar Americano', sigla:'USD'}, {nome: 'Dólar Canadense', sigla:'CAD'},
              {nome: 'Dólar Australiano', sigla:'AUD'}, {nome: 'Euro', sigla:'EUR'},
              {nome: 'Libra Esterlina', sigla:'GBP'}, {nome: 'Peso Argentino', sigla:'ARS'},
              {nome: 'Peso Chileno', sigla:'CLP'}, {nome: 'Iene Japonês', sigla:'JPY'},
              {nome: 'Peso Mexicano', sigla:'MXN'}, {nome: 'Franco Suiço', sigla:'CHF'},
              {nome: 'Yuan Renmimbi Chinês', sigla:'CNY'}, {nome: 'Dólar Neozelandês', sigla:'NZD'},
              {nome: 'Peso Uruguaio', sigla:'UYU'}, {nome: 'Novo Sol Peruano', sigla:'PEN'}])

Agencia.create([{nome:'DG Câmbio', url: 'http://www.dgcambio.com.br/', parser: "DGCambioParser"},
                {nome:'SP Mundi', url: 'https://www.spmundi.com.br/', parser: "SPMundiParser"},
                {nome:'Cambionet', url: 'http://www.cambionet.com/', parser: "CambionetParser"},
                {nome:'AGK Corretora', url: 'http://www.agkcorretora.com.br', parser: "AGKCorretoraParser"},
                {nome:'4 Cantos Turismo', url: 'http://www.4cantoscambio.com.br/', parser: "QuatroCantosTurismoParser"},
                {nome:'Casa Aliança', url: 'http://www.casaalianca.com.br', parser: "CasaAliancaParser"},
                {nome:'Ultramar Viagens', url: 'http://www.ultramarviagens.com.br', parser: "UltramarViagensParser"},
                {nome:'Confidence', url: 'https://confidencecompraonline.com.br', parser: "ConfidenceParser"},
                {nome:'Sidney Câmbio', url: 'http://www.sidney.com.br', parser: "SidneyCambioParser"},
                {nome:'AVS Turismo', url: 'https://www.avsturismo.com.br', parser: "AVSTurismoParser"},
                {nome:'Picchioni Câmbio Virtual', url: 'https://www.picchionicambiovirtual.com.br/', parser: "PicchioniCambioParser"},                {nome:'Singratur', url: 'http://www.singratur.com.br', parser: "SingraturParser"},
                {nome:'DS Câmbios e Vistos', url: 'http://cambioevistos.com.br', parser: "DsCambioVistosParser"},
                {nome:'FlexCambio', url: 'http://www.flexcambio.com.br/', parser: "FlexCambioParser"},
                {nome:'Torre Câmbio', url: 'http://www.torrecambio.com.br/', parser: "TorreCambioParser"},
                {nome:'Maxima Câmbio', url: 'https://lojavirtual.maximacambio.com.br', parser: "MaximaCambioParser"},
                {nome:'Prontur', url: 'http://www.prontur.com.br/turismo/', parser: "PronturParser"}])