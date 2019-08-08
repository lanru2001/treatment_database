class TreatmentRecordsController < ApplicationController
  before_action :set_treatment_record

  def create
    @treatment_record = TreatmentRecord.create(treatment_record_params)
    @treatment_record.save
    redirect_to conservation_record_path(@treatment_record.conservation_record)
  end

  def update
    byebug
    @treatment_record.update(treatment_record_params)
    redirect_to conservation_record_path(@treatment_record.conservation_record)
  end

  private

  def treatment_record_params
    params.require(:treatment_record).permit(
      :description_binding,
      :description_textblock,
      :description_primary_support,
      :description_medium,
      :description_attachments_inserts,
      :description_housing,
      :condition_summary,
      :condition_binding,
      :condition_textblock,
      :condition_primary_support,
      :condition_medium,
      :condition_housing,
      :condition_housing_naritive,
      :condition_attachments_inserts,
      :condition_previous_treatment,
      :condition_materials_analysis,
      :treatment_proposal_proposal,
      :treatment_proposal_housing_need,
      :treatment_proposal_factors_influencing_treatment,
      :treatment_proposal_performed_treatment,
      :treatment_proposal_housing_provided,
      :treatment_proposal_housing_narrative,
      :treatment_proposal_storage_and_handling_notes,
      :treatment_proposal_total_treatment_time,
      :conservation_record_id
    )
  end

  def set_treatment_record
    @treatment_record = TreatmentRecord.find(params[:id])
  end
end
