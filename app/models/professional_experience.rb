class ProfessionalExperience
  include Mongoid::Document

  field :company
  field :position
  field :from, type: Date
  field :to, type: Date
  field :description

  embedded_in :resume
end
