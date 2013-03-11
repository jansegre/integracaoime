class ProjectExperience
  include Mongoid::Document

  field :name
  field :from, type: Date
  field :to, type: Date
  field :description

  embedded_in :resume
end
