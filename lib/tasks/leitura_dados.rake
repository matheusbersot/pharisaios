require 'open-uri'

namespace :leitura_dados do

  desc "Lê dados dos sites de câmbio"
  task :task1 => :environment do

    p = "TorreCambioParser".constantize.obter_dados
    q = "SPMundiParser".constantize.obter_dados
    puts p, q

  end
end
