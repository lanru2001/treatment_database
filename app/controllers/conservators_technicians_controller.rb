# frozen_string_literal: true

class ConservatorsTechniciansController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def create
    @conservation_record = ConservationRecord.find(params[:conservation_record_id])
    @conservators_technicians_record = @conservation_record.conservators_technicians_records.create(create_params)
    redirect_to conservation_record_path(@conservation_record)
  end

  def destroy
    @conservation_record = ConservationRecord.find(params[:conservation_record_id])
    @conservators_technicians_record = @conservation_record.conservators_technicians_records.find(params[:id])
    @conservators_technicians.destroy
    redirect_to conservation_record_path(@conservation_record)
  end

  private

  def create_params
    params.require(:conservators_technicians_record).permit(:performed_by_vendor_id)
  end
end
