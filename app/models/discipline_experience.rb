class DisciplineExperience
  include Mongoid::Document

  field :name
  field :date, type: Date
  field :description

  embedded_in :resume
end
