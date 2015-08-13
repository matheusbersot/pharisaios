require 'open-uri'

namespace :leitura_dados do

  desc "Lê dados dos sites de câmbio e salva no banco de dados"
  task :task1 => :environment do

    Agencia.all.each do |agencia|
      begin
        valoresMoedas = agencia.parser.constantize.obter_dados
        agenciaMoedas = AgenciaMoeda.where(:agencia => agencia)

        if (agenciaMoedas.empty?)
          valoresMoedas.each do |valorMoeda|
            agenciaMoeda = AgenciaMoeda.new
            agenciaMoeda.agencia = agencia
            moeda = Moeda.find_by_sigla(valorMoeda[0])
            if moeda
              agenciaMoeda.moeda = moeda
            end
            agenciaMoeda.valor = valorMoeda[1]
            agenciaMoeda.diffUltimaAtualizacao = 0
            agenciaMoeda.save!
          end
        else
          agenciaMoedas.each do |agenciaMoeda|
            valoresMoedas.each do |valorMoeda|
              if (agenciaMoeda.moeda.sigla == valorMoeda[0]) && (agenciaMoeda.valor != valorMoeda[1])
                diffTempo = (Time.now.gmtime - agenciaMoeda.updated_at)
                agenciaMoeda.update(:valor => valorMoeda[1], :diffUltimaAtualizacao =>  diffTempo)
              end
            end
          end
        end
      rescue => erro
        puts erro.message
      end
    end
  end
end
