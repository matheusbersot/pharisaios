class MoedaController < ApplicationController

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

end
