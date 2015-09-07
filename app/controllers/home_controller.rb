class HomeController < ApplicationController

  def obterValoresDeUmaMoeda
    moeda = Moeda.find_by_sigla(params[:sigla_moeda])
    listaValores = nil
    if moeda
      listaValores = AgenciaMoeda.where(:moeda => moeda)
    end

    respond_to do |format|
      format.json { render :json => listaValores }
    end

  end

  def obterValoresDeTodasMoedas
    listaValores = AgenciaMoeda.all

    respond_to do |format|
      format.json { render :json => listaValores }
    end
  end

  def obterMoedas
    listaValores = Moeda.all

    respond_to do |format|
      format.json do
         render :json => listaValores.map { |valor| {:id => valor.id, :nome => valor.nome, :sigla => valor.sigla}}
      end
    end
  end

  def obterAgencias
    listaValores = Agencia.all

    respond_to do |format|
      format.json do
        render :json => listaValores.map { |valor| {:id => valor.id, :nome => valor.nome, :url => valor.url}}
      end    end
  end

end
