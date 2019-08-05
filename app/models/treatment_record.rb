# frozen_string_literal: true

class TreatmentRecord < ApplicationRecord
  belongs_to :conservation_record
end
