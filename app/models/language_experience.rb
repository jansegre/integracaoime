class LanguageExperience
  include Mongoid::Document

  field :language
  field :level
  field :certificates

  embedded_in :resume
end
