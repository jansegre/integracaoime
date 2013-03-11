class CourseExperience
  include Mongoid::Document

  field :name
  field :date, type: Date
  field :institution
  field :description

  embedded_in :resume
end
