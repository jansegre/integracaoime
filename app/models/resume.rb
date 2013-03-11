class Resume
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :image
  mount_uploader :image, HintImageUploader

  embeds_many :professional_experiences
  embeds_many :voluntary_experiences
  embeds_many :language_experiences
  embeds_many :project_experiences
  embeds_many :notable_experiences
  embeds_many :publication_experiences
  embeds_many :course_experiences

  accepts_nested_attributes_for :professional_experiences,
                                :voluntary_experiences,
                                :language_experiences,
                                :project_experiences,
                                :notable_experiences,
                                :publication_experiences,
                                :course_experiences,
                                allow_destroy: true,
                                reject_if: :all_blank

  validates_presence_of :user
end
