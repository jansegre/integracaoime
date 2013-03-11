class VoluntaryExperience
  include Mongoid::Document

  field :initiative
  field :position
  field :from, type: Date
  field :to, type: Date
  field :description

  embedded_in :resume
end
