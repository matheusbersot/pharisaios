require 'open-uri'

namespace :leitura_dados do

  desc "Lê dados dos sites de câmbio"
  task :task1 => :environment do
    puts "TorreCambioParser".constantize.obter_dados
    puts "SPMundiParser".constantize.obter_dados
    puts "SingraturParser".constantize.obter_dados
    puts "MaximaCambioParser".constantize.obter_dados
    puts "DsCambioVistosParser".constantize.obter_dados
    puts "QuatroCantosCambioParser".constantize.obter_dados
    puts "UltramarViagensParser".constantize.obter_dados
    puts "SidneyCambioParser".constantize.obter_dados
    puts "AVSTurismoParser".constantize.obter_dados
  end
end
