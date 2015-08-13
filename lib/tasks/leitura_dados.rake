require 'open-uri'

namespace :leitura_dados do

  desc "Lê dados dos sites de câmbio"
  task :task1 => :environment do

    puts "TorreCambioParser".constantize.obter_dados
    puts "SPMundiParser".constantize.obter_dados
    puts "SingraturParser".constantize.obter_dados
    puts "MaximaCambioParser".constantize.obter_dados
    puts "DsCambioVistosParser".constantize.obter_dados

  end
end
