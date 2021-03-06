class CountriesController < ApplicationController
  def index
    if params.include? "currency"
      @countries = country_select.where(currencies: { code: params["currency"].upcase })
    else
      @countries = country_select
    end
    json_response(@countries)
  end

  def a2
    @country = country_select.where({a2: params[:a2].upcase})
    json_response(@country.first)
  end

  def a3
    @country = country_select.where({a3: params[:a3].upcase})
    json_response(@country.first)
  end

  def disable
    @country = Country.find(params[:id])
    @country.update(enabled: 0)
    head :no_content
  end

  private

  # Standardized way to view countries from the database
  def country_select
    Country.select(:id, :name, :a2, :a3, 'currencies.code AS currency_code').joins(:currency).where({enabled: true})
  end
end
