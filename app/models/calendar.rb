class Calendar
  include Mongoid::Document

  field :calendar,  type: String
  field :year,      type: Integer
  field :specialty, type: String

  mount_uploader :calendar, CalendarUploader

  validates_presence_of :calendar, :year
  validates_numericality_of :year,
                            only_integer: true,
                            greater_than: 1700,
                            less_than: 2100

  index({ year: 1})
end
