require 'rails_helper'

RSpec.describe 'Countries API', type: :request do
  let(:name) { 'Foo Bar' }

  describe 'GET /countries' do
    let!(:currencies) { create_list(:currency, 1) }
    let!(:countries) { create_list(:country, 5) + create_list(:country, 3, enabled: 0) }

    before do
      get "/countries" 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns enabled countries' do
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns the expected set of values for each country' do
      JSON.parse(response.body).each do |country|
        ['id', 'name', 'a2', 'a3', 'currency_code'].each do |key|
          expect(country).to have_key(key)
        end
        expect(country.length).to eq(5)
      end
    end
  end

  describe 'GET /countries?currency=' do
    let!(:currencies) { create_list(:currency, 2) }
    let!(:countries) { create_list(:country, 5, currency_id: 1) + create_list(:country, 3, currency_id: 2) }

    let(:currency_filter) { currencies.first.code }
  
    before do
      get "/countries?currency=#{currency_filter}"
    end

      
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns filtered countries' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'GET /countries/a2/:id' do
    let!(:currencies) { create_list(:currency, 1) }
    let!(:countries) { create_list(:country, 5) }

    let(:rand_country) { rand(5) }

    before do
      get "/countries/a2/#{countries[rand_country].a2}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns the country with matching alpha 2 code' do
      expect(JSON.parse(response.body)['name']).to eq(countries[rand_country].name)
    end
  end

  describe 'GET /countries/a3/:id' do
    let!(:currencies) { create_list(:currency, 1) }
    let!(:countries) { create_list(:country, 5) }

    let(:rand_country) { rand(5) }

    before do
      get "/countries/a3/#{countries[rand_country].a3}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns the country with matching alpha 3 code' do
      expect(JSON.parse(response.body)['name']).to eq(countries[rand_country].name)
    end
  end

  describe 'PUT /countries/:id/disable' do
    let!(:currencies) { create_list(:currency, 1) }
    let!(:countries) { create_list(:country, 1) }
    
    before do
      put "/countries/1/disable"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'returns an empty body' do
      expect(response.body).to eq('')
    end

    it 'has disabled the country' do
      countries.first.reload
      expect(countries.first.enabled).to eq(false)
    end
  end
end
