# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users
  resources :controlled_vocabularies, except: [:destroy]

  resources :conservation_records do
    resources :in_house_repair_records
    resources :external_repair_records
    resources :con_tech_records
    resources :treatment_reports
    resources :cost_return_reports
  end

  get 'search/help'
  get 'search', to: 'search#results', as: 'search'
  root 'front#index'
  get 'front/index'
  get 'conservation_records/:id/conservation_worksheet', to: 'conservation_records#conservation_worksheet', as: 'conservation_worksheet'
  get 'conservation_records/:id/treatment_report', to: 'conservation_records#treatment_report', as: 'treatment_report'
end
