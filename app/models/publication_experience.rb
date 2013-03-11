class PublicationExperience
  include Mongoid::Document

  field :name
  field :date, type: Date
  field :topic
  field :description

  embedded_in :resume
end
