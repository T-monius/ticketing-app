class Ticket < ActiveRecord::Base
  validates :status, inclusion: { in: %w(new blocked in_progress ),
                                  message: "%{value} not a valid status." }

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags
  belongs_to :project
end