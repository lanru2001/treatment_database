class CreateTreatmentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :treatment_records do |t|
      # Description Fields
      t.text :description_general_remarks
      t.text :description_binding
      t.text :description_textblock
      t.text :description_primary_support
      t.text :description_medium
      t.text :description_attachments_inserts
      t.text :description_housing

      # Condition Fields
      t.text :condition_summary
      t.text :condition_binding
      t.text :condition_textblock
      t.text :condition_primary_support
      t.text :condition_medium
      t.integer :condition_housing
      t.text :condition_housing_naritive
      t.text :condition_attachments_inserts
      t.text :condition_previous_treatment
      t.text :condition_materials_analysis

      # Treatment Proposal Fields
      t.text :treatment_proposal_proposal
      t.integer :treatment_proposal_housing_need
      t.text :treatment_proposal_factors_influencing_treatment
      t.text :treatment_proposal_performed_treatment
      t.integer :treatment_proposal_housing_provided
      t.text :treatment_proposal_housing_narrative
      t.text :treatment_proposal_storage_and_handling_notes
      t.integer :treatment_proposal_total_treatment_time

      t.references :conservation_record, foreign_key: true

      t.timestamps
    end
  end
end
