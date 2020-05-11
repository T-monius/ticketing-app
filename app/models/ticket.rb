class Ticket < ActiveRecord::Base
  validates :status, inclusion: { in: %w(new blocked in_progress ),
                                  message: "%{value} not a valid status." }

  belongs_to :project
end