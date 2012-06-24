class Task
  include Mongoid::Document
  field :description, type: String
  field :completed, type: Boolean, default: false
  field :deadline, type: Time

  validates :description, presence: true
end
