class ReferenceExperience
  include Mongoid::Document

  field :name
  field :contact
  field :file

  mount_uploader :file, ReferenceUploader

  embedded_in :resume
end
