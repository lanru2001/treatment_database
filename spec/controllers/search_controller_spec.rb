# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  include Devise::TestHelpers
  render_views

  before do
    create(:conservation_record)
    create(:conservation_record, item_record_number: 'i1001')
    create(:conservation_record, title: 'Third Title')
  end

  it 'can search for documents by database id' do
    get :results, params: { search: '1' }
    expect(response).to redirect_to(conservation_record_path(1))
  end

  it 'can search for documents by item record number' do
    get :results, params: { search: 'i1001' }
    expect(response).to redirect_to(conservation_record_path(2))
  end

  it 'can search for documents by title' do
    get :results, params: { search: 'Third' }
    expect(response.body).to have_text('Searching for Third')
    expect(response.body).to have_text('Third Title')
    expect(response.body).to have_link('Show')
  end

  it 'shows no results when looking up non-extant id' do
    get :results, params: { search: '8' }
    expect(response.body).to have_text('No Results for 8')
  end
end
