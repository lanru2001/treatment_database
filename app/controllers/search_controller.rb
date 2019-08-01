# frozen_string_literal: true

class SearchController < ApplicationController
  def results
    @search_string = params[:search]
    if @search_string =~ /^i\d{1,}/
      @records = ConservationRecord.find_by(item_record_number: @search_string)
      redirect_to conservation_record_path(@records) unless @records.nil?
    elsif @search_string =~ /^\d+$/
      @records = ConservationRecord.find_by(id: @search_string)
      redirect_to conservation_record_path(@records) unless @records.nil?
    else
      @records = ConservationRecord.where('title LIKE ?', "%#{@search_string}%")
    end
    @records
  end
end
